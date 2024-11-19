import 'package:flutter/material.dart';

import '../address_screens/address_screens.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png',
              width: 130,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            _buildOption(
              image: "man",
              context,
              title: "Thông tin cá nhân",
              onTap: () {},
            ),
            _buildDivider(),
            _buildOption(
              image: "home_address",
              context,
              title: "Địa chỉ nhận hàng",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddressScreens()),
                );
              },
            ),
            _buildDivider(),
            _buildOption(
              image: "history_time",
              context,
              title: "Lịch sử đã xem",
              onTap: () {},
            ),
            _buildDivider(),
            _buildOption(
              image: "feedback",
              context,
              title: "Đánh giá ứng dụng",
              onTap: () {},
            ),
            _buildDivider(),
            _buildOption(
              image: "customer_satisfaction",
              context,
              title: "Đánh giá sản phẩm",
              onTap: () {},
            ),
            _buildDivider(),
            _buildOption(
              image: "rules",
              context,
              title: "Điều khoản sử dụng",
              onTap: () {},
            ),
            _buildDivider(),
            _buildOption(
              image: "compliant",
              context,
              title: "Chính sách bảo mật",
              onTap: () {},
            ),
            _buildDivider(),
            _buildOption(
              image: "suport",
              context,
              title: "Trung tâm hỗ trợ",
              onTap: () {},
            ),
            _buildDivider(),
            _buildOption(
              image: "log_out",
              context,
              title: "Đăng xuất",
              onTap: () {},
            ),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required String title,
      required String image,
      required VoidCallback onTap}) {
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
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Icon(Icons.arrow_right, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey[300],
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
