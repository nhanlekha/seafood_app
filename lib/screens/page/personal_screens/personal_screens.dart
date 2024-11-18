import 'package:flutter/material.dart';

import '../address_screens/address_screens.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tiêu đề của trang hồ sơ cá nhân
            Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green], // Màu gradient
                ),
              ),
              child: const Center(
                child: Text(
                  "Hồ sơ cá nhân",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Màu chữ
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Khoảng cách phía dưới tiêu đề

            // Ảnh đại diện
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(50), // Bo tròn viền của Card
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/man1.png', // Đường dẫn tới ảnh
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover, // Đảm bảo ảnh vừa với khung hình
                ),
              ),
            ),
            SizedBox(height: 10), // Khoảng cách phía dưới ảnh

            // Tên người dùng
            Text(
              "Khả Nhân",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Khoảng cách phía dưới tên

            // Danh sách tùy chọn
            _buildOption(
              image: "man",
              context,
              title: "Thông tin cá nhân",
              onTap: () {
                // Điều hướng đến trang Thông tin cá nhân
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "home_address",
              context,
              title: "Địa chỉ nhận hàng",
              onTap: () {
                // Điều hướng đến trang Địa chỉ nhận hàng
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddressScreens()),
                );
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "history_time",
              context,
              title: "Lịch sử đã xem",
              onTap: () {
                // Điều hướng đến trang Lịch sử đã xem
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "feedback",
              context,
              title: "Đánh giá ứng dụng",
              onTap: () {
                // Điều hướng đến trang Đánh giá ứng dụng
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "customer_satisfaction",
              context,
              title: "Đánh giá sản phẩm",
              onTap: () {
                // Điều hướng đến trang Đánh giá sản phẩm
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "rules",
              context,
              title: "Điều khoản sử dụng",
              onTap: () {
                // Điều hướng đến trang Điều khoản sử dụng
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "compliant",
              context,
              title: "Chính sách bảo mật",
              onTap: () {
                // Điều hướng đến trang Chính sách bảo mật
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "suport",
              context,
              title: "Trung tâm hỗ trợ",
              onTap: () {
                // Điều hướng đến trang Trung tâm hỗ trợ
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "log_out",
              context,
              title: "Đăng xuất",
              onTap: () {
                // Xử lý đăng xuất
              },
            ),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  // Widget để tạo tùy chọn
  Widget _buildOption(BuildContext context,
      {required String title,required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: Image.asset('assets/images/$image.png'),
                ), // Biểu tượng cho tùy chọn
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Icon(Icons.arrow_right, size: 20), // Biểu tượng mũi tên
          ],
        ),
      ),
    );
  }

  // Widget để tạo đường phân cách giữa các tùy chọn
  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey[300], // Màu cho đường phân cách
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
