import 'package:flutter/material.dart';
import '../../widgets/product_card.dart';
import '../../../bloc/slide/slide_state.dart';
import '../../../domans/repo/slide_repo.dart';
import '../../../ultils/enums/enum_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/category/category_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:seafood_app/model/product_model.dart';
import 'package:seafood_app/model/category_model.dart';
import 'package:seafood_app/domans/repo/cate_repo.dart';
import 'package:seafood_app/bloc/slide/slide_cubit.dart';
import 'package:seafood_app/domans/repo/product_repo.dart';
import 'package:seafood_app/bloc/product/product_cubit.dart';
import 'package:seafood_app/bloc/product/product_state.dart';
import 'package:seafood_app/bloc/category/category_cubit.dart';
import 'package:seafood_app/domans/repo/impl/slide_repo_impl.dart';

class CategoryScreens extends StatelessWidget {
  const CategoryScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) {
          final slideRepo = context.read<SlideRepo>();
          return SlideCubit(slideRepo);
        },
      ),
      BlocProvider(create: (context) {
        final cateRepo = context.read<CateRepo>();
        return CategoryCubit(cateRepo);
      }),
      BlocProvider(create: (context) {
        final productRepo = context.read<ProductRepo>();
        return ProductCubit(productRepo);
      }),
    ], child: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // Sử dụng Expanded để phần này chiếm không gian còn lại
          child: SingleChildScrollView(
            // Cho phép cuộn cho carousel và danh sách danh mục
            child: Column(
              children: [buildListCardCategory(), buildListCardProduct()],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardCategory(CategoryModel cate) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 75,
            height: 55,
            padding: const EdgeInsets.all(1),
            child: Image.network(
              cate.categoryImage ?? '',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: Text(
              cate.categoryName ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListCardCategory() {
    final categoryCubit = context.read<CategoryCubit>();
    categoryCubit.fetchData();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft, // Căn trái
          child: const Text(
            "Danh mục",
            style: TextStyle(
              fontSize: 24, // Kích thước chữ
              fontWeight: FontWeight.bold, // Chữ đậm
              color: Colors.blueAccent, // Màu chữ
            ),
          ),
        ),
        // Khoảng cách giữa tiêu đề và GridView
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            switch (state.dataStatus) {
              case DataStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case DataStatus.success:
                List<CategoryModel> listCate = state.dataModel.data;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                    children: List.generate(
                      listCate.length,
                      (index) => _buildCardCategory(listCate[index]),
                    ),
                  ),
                );

              case DataStatus.error:
                return const Center(
                    child: Text("Có lỗi xảy ra!")); // Hiển thị thông báo lỗi
              case DataStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case DataStatus.empty:
                return const Center(
                    child: Text(
                        "Không có danh mục nào!")); // Hiển thị thông báo khi không có dữ liệu
            }
          },
        ),
      ],
    );
  }

  Widget buildListCardProduct() {
    final productCubit = context.read<ProductCubit>();
    productCubit.fetchProductDataByCategoryId([3, 6, 7, 8, 9, 10]);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Sản phẩm",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            switch (state.dataStatus) {
              case DataStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case DataStatus.success:
                Map<String, List<ProductModel>> productsByCategory = {};

                // Phân loại sản phẩm theo danh mục
                state.dataProductsByCategory?.data?.forEach((product) {
                  final category = product.categoryName ?? "Khác";
                  if (!productsByCategory.containsKey(category)) {
                    productsByCategory[category] = [];
                  }
                  productsByCategory[category]!.add(product);
                });

                // Tạo danh sách theo từng danh mục
                return Column(
                  children: productsByCategory.entries.map((entry) {
                    String categoryName = entry.key;
                    List<ProductModel> products = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categoryName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 275,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              ProductModel product = products[index];
                              return SizedBox(
                                width: 215,
                                child: ProductCard(
                                  productName:
                                      product.productName ?? "Tên Sản Phẩm",
                                  categoryName: categoryName,
                                  rating: 5,
                                  reviewCount: 1,
                                  orderStatus: product.statusOrder ?? "1s",
                                  price:
                                      "${product.productPrice?.toStringAsFixed(0) ?? '0'}k",
                                  unit: product.productUnit ?? "1 đơn vị",
                                  imageUrl: product.productImage ??
                                      "http://192.168.1.14/DoAnCNWeb/public/fontend/assets/img/slider/1658375485072.jpg",
                                  iconUrl: "assets/images/hotproduct.png",
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              case DataStatus.error:
                return const Center(child: Text("Có lỗi xảy ra!"));
              case DataStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case DataStatus.empty:
                return const Center(child: Text("Không có sản phẩm nào!"));
            }
          },
        ),
      ],
    );
  }

  // Widget _buildCardProduct(ProductModel product) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           width: 75,
  //           height: 55,
  //           padding: const EdgeInsets.all(1),
  //           child: Image.network(
  //             product.productImage ?? '',
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
  //           child: Text(
  //             product.productName ?? '',
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 13,
  //               height: 1.2,
  //             ),
  //             textAlign: TextAlign.center,
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //             softWrap: true,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
