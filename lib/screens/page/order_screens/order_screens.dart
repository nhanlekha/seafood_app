import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/model/order_model.dart';
import 'package:seafood_app/screens/widgets/order_card.dart';

class OrderScreens extends StatelessWidget {
  const OrderScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration:
        BoxDecoration(color: Colors.grey[100])
        ,child: const OrderPage());
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          buildSearchToolbar(context),
          const TabBar(
            tabs: [
              Tab(text: "Đang xử lý"),
              Tab(text: "Đang giao"),
              Tab(text: "Hoàn thành"),
              Tab(text: "Đã hủy"),
            ],
            labelColor: kOrangeColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: kOrangeColor,
          ),
          Expanded(
            child: TabBarView(
              children: [
                buildOrderList(context, "Đang xử lý"),
                buildOrderList(context, "Đang giao"),
                buildOrderList(context, "Hoàn thành"),
                buildOrderList(context, "Đã hủy"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOrderList(BuildContext context, String status) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 1; i < 6; i++) OrderCard(order: OrderModel(),),
        ],
      ),
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
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Nhập vào mã đơn hàng?",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
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
Widget _buildCartIcon(BuildContext context) {
  return Expanded(
    flex: 1, // Tương ứng với android:layout_weight="0.1"
    child: GestureDetector(
      onTap: () {
        context.push('/cart');
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
