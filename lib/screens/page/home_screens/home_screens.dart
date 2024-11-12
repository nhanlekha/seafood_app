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

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

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
        buildSearchToolbar(), // Phần tìm kiếm không cuộn
        Expanded(
          // Sử dụng Expanded để phần này chiếm không gian còn lại
          child: SingleChildScrollView(
            // Cho phép cuộn cho carousel và danh sách danh mục
            child: Column(
              children: [
                const SimpleCarouselDemo(), // Carousel có thể cuộn
                buildListCardCategory(),
                buildListNewProduct(),
                buildListTrendingProduct() // Danh sách danh mục có thể cuộn
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardCategory(CategoryModel cate) {
    return Container(
      child: Card(
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
              // Thêm padding để tạo khoảng trống
              child: Text(
                cate.categoryName ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                // Giới hạn số dòng để tránh tràn
                overflow: TextOverflow.ellipsis,
                // Thêm dấu '...' nếu quá dài
                softWrap: true,
              ),
            ),
          ],
        ),
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
                    // Cho phép GridView tự động điều chỉnh chiều cao
                    crossAxisCount: 4,
                    // 4 cột
                    mainAxisSpacing: 8,
                    // Khoảng cách dọc giữa các phần tử
                    crossAxisSpacing: 8,
                    // Khoảng cách ngang giữa các phần tử
                    childAspectRatio: 1,
                    // Tỷ lệ khung hình 1:1
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

  Widget buildListTrendingProduct() {
    final productCubit = context.read<ProductCubit>();
    productCubit.fetchTrendingProductData();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft, // Căn trái
          child: const Text(
            "Sản phẩm thịnh hành",
            style: TextStyle(
              fontSize: 24, // Kích thước chữ
              fontWeight: FontWeight.bold, // Chữ đậm
              color: Colors.blueAccent, // Màu chữ
            ),
          ),
        ),
        // Khoảng cách giữa tiêu đề và GridView
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            switch (state.dataStatus) {
              case DataStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case DataStatus.success:
                List<ProductModel> listProduct =
                    state.dataTrendingProductModel?.data ?? [];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height:
                        275, // Đặt chiều cao của container để chứa danh sách
                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Đặt chiều cuộn là ngang
                      itemCount: listProduct.length ??
                          0, // Số lượng mục trong danh sách
                      itemBuilder: (context, index) {
                        ProductModel product = listProduct[index];
                        return SizedBox(
                            width: 215, // Chiều rộng của mỗi mục
                            child: ProductCard(
                              productName:
                                  product.productName ?? "Tên Sản Phẩm",
                              categoryName:
                                  product.categoryName ?? "Tên Danh Mục",
                              rating:
                                  5, // Bạn có thể cập nhật trường này nếu cần
                              reviewCount:
                                  1, // Bạn có thể cập nhật trường này nếu cần
                              orderStatus: product.statusOrder ??
                                  "1s", // Bạn có thể cập nhật trường này nếu cần
                              price:
                                  "${product.productPrice?.toStringAsFixed(0) ?? '0'}k", // Hiển thị giá
                              unit: product.productUnit ?? "1 đơn vị", // Đơn vị
                              imageUrl: product.productImage ??
                                  "http://192.168.1.14/DoAnCNWeb/public/fontend/assets/img/slider/1658375485072.jpg", // Ảnh sản phẩm
                              iconUrl:
                                  "assets/images/hotproduct.png", // Thay bằng URL thực tế nếu cần
                            ));
                      },
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
                        "Không có sp nào!")); // Hiển thị thông báo khi không có dữ liệu
            }
          },
        ),
      ],
    );
  }

  Widget buildListNewProduct() {
    final productCubit = context.read<ProductCubit>();
    productCubit.fetchNewProductData();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft, // Căn trái
          child: const Text(
            "Sản phẩm mới",
            style: TextStyle(
              fontSize: 24, // Kích thước chữ
              fontWeight: FontWeight.bold, // Chữ đậm
              color: Colors.blueAccent, // Màu chữ
            ),
          ),
        ),
        // Khoảng cách giữa tiêu đề và GridView
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            switch (state.dataStatus) {
              case DataStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case DataStatus.success:
                List<ProductModel> listNewProduct =
                    state.dataNewProductModel?.data ?? [];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height:
                        275, // Đặt chiều cao của container để chứa danh sách
                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Đặt chiều cuộn là ngang
                      itemCount: listNewProduct.length ??
                          0, // Số lượng mục trong danh sách
                      itemBuilder: (context, index) {
                        ProductModel product = listNewProduct[index];
                        return SizedBox(
                            width: 215, // Chiều rộng của mỗi mục
                            child: ProductCard(
                              productName:
                                  product.productName ?? "Tên Sản Phẩm",
                              categoryName:
                                  product.categoryName ?? "Tên Danh Mục",
                              rating:
                                  5, // Bạn có thể cập nhật trường này nếu cần
                              reviewCount:
                                  1, // Bạn có thể cập nhật trường này nếu cần
                              orderStatus: product.statusOrder ??
                                  "1s", // Bạn có thể cập nhật trường này nếu cần
                              price:
                                  "${product.productPrice?.toStringAsFixed(0) ?? '0'}k", // Hiển thị giá
                              unit: product.productUnit ?? "1 đơn vị", // Đơn vị
                              imageUrl: product.productImage ??
                                  "http://192.168.1.14/DoAnCNWeb/public/fontend/assets/img/slider/1658375485072.jpg", // Ảnh sản phẩm
                              iconUrl:
                                  "assets/images/hotproduct.png", // Thay bằng URL thực tế nếu cần
                            ));
                      },
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
                        "Không có sp nào!")); // Hiển thị thông báo khi không có dữ liệu
            }
          },
        ),
      ],
    );
  }
}

class SimpleCarouselDemo extends StatefulWidget {
  const SimpleCarouselDemo({super.key});

  @override
  _SimpleCarouselDemoState createState() => _SimpleCarouselDemoState();
}

class _SimpleCarouselDemoState extends State<SimpleCarouselDemo> {
  late SlideCubit slideCubit;

  @override
  void initState() {
    // TODO: implement initState
    slideCubit = context.read<SlideCubit>();
    slideCubit.fetchData();
    super.initState();
  }

  final List<String> _images = [
    '',
    '',
    '',
    '',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SlideCubit, SlideState>(
          builder: (context, state) {
            switch (state.dataStatus) {
              case (DataStatus.initial):
                return const Center(child: CircularProgressIndicator());
                break;
              case DataStatus.success:
                return CarouselSlider(
                  items: state.dataModel.data.map<Widget>((data) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            data.sliderImage,
                            // Ensure this field is correctly defined in your SliderModel
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        );
                      },
                    );
                  }).toList(), // Ensure that this results in a List<Widget>
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                );

                break;
              case (DataStatus.error):
                return const Center(child: CircularProgressIndicator());
                break;
              case DataStatus.loading:
                return const Center(child: CircularProgressIndicator());
              // TODO: Handle this case.
              case DataStatus.empty:
                return const Center(child: CircularProgressIndicator());
              // TODO: Handle this case.
            }
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images.asMap().entries.map((entry) {
            return Container(
              width: 9.0,
              height: 9.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.amber)
                    .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Hàm để tạo toolbar tìm kiếm
Widget buildSearchToolbar() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogo(), // Gọi hàm để tạo logo
        _buildSearchField(), // Gọi hàm để tạo ô tìm kiếm
        _buildCartIcon(), // Gọi hàm để tạo biểu tượng giỏ hàng
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

// Hàm để xây dựng biểu tượng giỏ hàng
Widget _buildCartIcon() {
  return Expanded(
    flex: 1, // Tương ứng với android:layout_weight="0.1"
    child: Container(
      margin: const EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/cargo.png', // Đường dẫn tới ảnh giỏ hàng
        height: 25,
      ),
    ),
  );
}
