import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        buildSearchToolbar(context),
        Expanded(
          // Sử dụng Expanded để phần này chiếm không gian còn lại
          child: SingleChildScrollView(
            // Cho phép cuộn cho carousel và danh sách danh mục
            child: Column(
              children: [buildListCardProduct()],
            ),
          ),
        ),
      ],
    );
  }


// Hàm để tạo toolbar tìm kiếm
  Widget buildSearchToolbar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo(), // Gọi hàm để tạo logo
          _buildSearchField(), // Gọi hàm để tạo ô tìm kiếm
          _buildCartIcon(context), // Gọi hàm để tạo biểu tượng giỏ hàng
        ],
      ),
    );
  }

// Hàm để xây dựng logo
  Widget _buildLogo() {
    return Expanded(
      flex: 2, // Tương ứng với android:layout_weight="0.2"
      child: Image.asset(
        'assets/images/logo.png', // Đường dẫn tới ảnh logo
        height: 50,
      ),
    );
  }

// Hàm để xây dựng ô tìm kiếm
  Widget _buildSearchField() {
    return Expanded(
      flex: 6, // Tương ứng với android:layout_weight="0.6"
      child: Container(
        margin: const EdgeInsets.only(left: 5, top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Bạn tìm gì hôm nay?",
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.search),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                // Logic để xóa nội dung tìm kiếm
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCartIcon(BuildContext context) {
    return Expanded(
      flex: 1, // Tương ứng với android:layout_weight="0.1"
      child: GestureDetector(
        onTap: () {
          // Xử lý sự kiện khi click vào giỏ hàng
          context.push(
              '/cart'
          );
          print("Giỏ hàng đã được click!");
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/cargo.png', // Đường dẫn tới ảnh giỏ hàng
            height: 25,
          ),
        ),
      ),
    );
  }


  Widget buildListCardProduct() {
    final productCubit = context.read<ProductCubit>();
    productCubit.fetchProductDataByCategoryId([3, 6, 7, 8, 9, 10]);

    return Column(
      children: [
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

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 6, right: 6), // Chỉ cách phần dưới
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
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
                                return Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 215,
                                  child: ProductCard(
                                    productModel: product,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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

}