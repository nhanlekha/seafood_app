import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/app_route_constants.dart';
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
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF5F5F5),
      ),
      child: Column(
        children: [
          buildSearchToolbar(context), // Phần tìm kiếm không cuộn
          Expanded(
            // Sử dụng Expanded để phần này chiếm không gian còn lại
            child: SingleChildScrollView(
              // Cho phép cuộn cho carousel và danh sách danh mục
              child: Column(
                children: [
                  const SimpleCarouselDemo(), // Carousel có thể cuộn
                  buildListCardCategory(),
                  buildCarouselBanner(),
                  buildListNewProduct(),
                  buildListTrendingProduct(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardCategory(CategoryModel cate) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
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
                fontWeight: FontWeight.w500,
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

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "DANH MỤC SẢN PHẨM 🦐",
                  style: TextStyle(
                    height: 1.0,
                    fontSize: 20, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Chữ đậm
                    color: Color(0xffef5908), // Màu chữ
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text("Xem thêm",

                        style: TextStyle(
                          height: 1.0,
                          fontSize: 14, // Kích thước chữ
                          color: Colors.grey, // Màu chữ
                        )),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
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
                    padding: const EdgeInsets.all(4.0),
                    child: GridView.count(
                      controller: ScrollController(
                        keepScrollOffset: false,
                      ),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
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
      ),
    );
  }

  Widget buildListTrendingProduct() {
    final productCubit = context.read<ProductCubit>();
    productCubit.fetchTrendingProductData();

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  "SẢN PHẨM HOT 🔥",
                  style: TextStyle(
                    fontSize: 20, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Chữ đậm
                    color: Color(0xffef5908), // Màu chữ
                  ),
                ),
              ],
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

                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF5F5F5),
                  ),
                  child: SizedBox(
                    height: 400,
                    // Đặt chiều cao của container để chứa danh sách
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        // Đặt chiều cuộn là ngang
                        itemCount: listProduct.length ?? 0,
                        // Số lượng mục trong danh sách
                        itemBuilder: (context, index) {
                          ProductModel product = listProduct[index];
                          return ProductCard(
                            productModel:
                                product, // Thay bằng URL thực tế nếu cần
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 0.7),
                      ),
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
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  "SẢN PHẨM MỚI ✨",
                  style: TextStyle(
                    fontSize: 20, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Chữ đậm
                    color: Color(0xffef5908), // Màu chữ
                  ),
                ),
              ],
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
                        240, // Đặt chiều cao của container để chứa danh sách
                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Đặt chiều cuộn là ngang
                      itemCount: listNewProduct.length ??
                          0, // Số lượng mục trong danh sách
                      itemBuilder: (context, index) {
                        ProductModel product = listNewProduct[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                              width: 170, // Chiều rộng của mỗi mục
                              child: ProductCard(
                                productModel: product,
                              )),
                        );
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

  Widget buildCarouselBanner() {
    return CarouselSlider(
      items: [
        const Image(
          image: AssetImage('assets/images/banner1.jpg'),
          fit: BoxFit.contain,
        ),
        const Image(
            image: AssetImage('assets/images/banner2.jpg'),
            fit: BoxFit.contain),
        const Image(
          image: AssetImage('assets/images/banner3.jpg'),
          fit: BoxFit.contain,
        ),
      ]
          .map((item) => Container(
                child: item,
              ))
          .toList(),
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          aspectRatio: 30 / 9,
          autoPlayInterval: const Duration(seconds: 5)),
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
        context.push('/cart');
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
