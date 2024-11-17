import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_app/model/product_model.dart';
import 'package:seafood_app/ultils/enums/enum_data.dart';
import 'package:seafood_app/domans/repo/product_repo.dart';
import 'package:seafood_app/bloc/product/product_cubit.dart';
import 'package:seafood_app/bloc/product/product_state.dart';
import 'package:seafood_app/screens/widgets/product_card.dart';

class FavouriteScreens extends StatelessWidget {
  const FavouriteScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) {
        final productRepo = context.read<ProductRepo>();
        return ProductCubit(productRepo);
      }),
    ], child: const FavourivePage());
  }
}

class FavourivePage extends StatefulWidget {
  const FavourivePage({super.key});

  @override
  State<FavourivePage> createState() => _FavourivePageState();
}

class _FavourivePageState extends State<FavourivePage> {
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
                  buildListNewProduct(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListNewProduct() {
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
                  "SẢN PHẨM YÊU THÍCH ❤️",
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
                    height: 600,
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
          // child: const Icon(
          //   Icons.shopping_cart_outlined,
          //   size: 25,
          //   color: Colors.orange,
          // ),
          child: Image.asset(
            'assets/images/cargo.png', // Đường dẫn tới ảnh giỏ hàng
            height: 25,
          ),
        ),
      ),
    );
  }
}
