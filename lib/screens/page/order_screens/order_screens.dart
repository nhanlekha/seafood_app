import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderScreens extends StatelessWidget {
  const OrderScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderPage();
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Column(
        children: [
          buildSearchToolbar(context), // Phần tìm kiếm không cuộn
          TabBar(
            tabs: [
              Tab(text: "Đang xử lý"),
              Tab(text: "Đang giao"), // Tab "Đang đặt"
              Tab(text: "Hoàn thành"), // Tab "Hoàn thành"
              Tab(text: "Đã hủy"), // Tab "Đã hủy"
            ],
            labelColor: Colors.blueAccent,
            // Màu sắc cho tab đang được chọn
            unselectedLabelColor: Colors.black,
            // Màu sắc cho tab không được chọn
            indicatorColor: Colors.blueAccent, // Màu của chỉ báo dưới tab
          ),
          Expanded( // Sử dụng Expanded để phần này chiếm không gian còn lại
            child: TabBarView(
              children: [
                buildOrderList("Đang xử lý"),
                // Xây dựng danh sách cho tab "Đang đặt"
                buildOrderList("Đang giao"),
                // Xây dựng danh sách cho tab "Đang đặt"
                buildOrderList("Hoàn thành"),
                // Xây dựng danh sách cho tab "Hoàn thành"
                buildOrderList("Đã hủy"),
                // Xây dựng danh sách cho tab "Đã hủy"
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Phương thức để xây dựng danh sách đơn hàng cho mỗi tab
  Widget buildOrderList(String status) {
    return SingleChildScrollView( // Cho phép cuộn cho danh sách
      child: Column(
        children: [
          Text("Danh sách đơn hàng: $status"), // Tiêu đề cho danh sách
          // Ở đây bạn có thể thêm các widget hiển thị đơn hàng theo trạng thái
          // Ví dụ:
          for (int i = 0; i < 10; i++)
            ListTile(
              title: Text("Đơn hàng $i - Trạng thái: $status"),
              subtitle: Text("Thông tin chi tiết..."),
            ),
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
      onTap: (){context.push('/cart');},
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