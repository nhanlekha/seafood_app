import 'package:flutter/material.dart';
import 'package:seafood_app/screens/widgets/vip_button.dart';
import 'package:seafood_app/screens/widgets/address_card.dart';

import 'add_address_screens.dart';

class AddressScreens extends StatefulWidget {
  const AddressScreens({super.key});

  @override
  State<AddressScreens> createState() => _AddressScreensState();
}

class _AddressScreensState extends State<AddressScreens> {
  bool isDefault1 = true;
  bool isDefault2 = false;
  bool isDefault3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh Sách Địa Chỉ',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.white),
            onPressed: () {
              // Hành động mở chat
            },
          ),
        ],
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 8,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
            // Chừa không gian cho các nút ở dưới
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AddressCard(
                    title: 'Địa chỉ 1',
                    addressDetails:
                        'Nhân Đz (987654321)\nok, Xã Cổ Linh, Huyện Pác Nặm, Tỉnh Bắc Kạn',
                    isDefault: isDefault1,
                    onDefaultChanged: (bool newValue) {
                      setState(() {
                        isDefault1 = newValue;
                      });
                    },
                    onEdit: () {
                      // Hành động chỉnh sửa địa chỉ
                    },
                    onDelete: () {
                      // Hành động xóa địa chỉ
                    },
                  ),
                  AddressCard(
                    title: 'Địa chỉ 2',
                    addressDetails:
                        'Trần A (123456789)\nP. Xuân Thủy, Q. Cầu Giấy, Hà Nội',
                    isDefault: isDefault2,
                    onDefaultChanged: (bool newValue) {
                      setState(() {
                        isDefault2 = newValue;
                      });
                    },
                    onEdit: () {
                      // Hành động chỉnh sửa địa chỉ
                    },
                    onDelete: () {
                      // Hành động xóa địa chỉ
                    },
                  ),
                  AddressCard(
                    title: 'Địa chỉ 3',
                    addressDetails: 'Hồ Đăng Nguyện (+84 382 876 922)\n470 Trần Đại Nghĩa, P. Hòa Hải, Q. Ngũ Hành Sơn, TP. Đà Nẵng',
                    isDefault: isDefault3,
                    onDefaultChanged: (bool newValue) {
                      setState(() {
                        isDefault3 = newValue;
                      });
                    },
                    onEdit: () {
                      // Hành động chỉnh sửa địa chỉ
                    },
                    onDelete: () {
                      // Hành động xóa địa chỉ
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VipButton(
                    icon: Icons.add_location,
                    text: 'Thêm Địa Chỉ',
                    textColor: Colors.white,
                    backgroundColor: Colors.green,
                    onPressed: () {
                      // Hành động thêm địa chỉ
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressScreens()));

                    },
                  ),
                  VipButton(
                    icon: Icons.shopping_cart,
                    text: 'Giỏ Hàng',
                    textColor: Colors.white,
                    backgroundColor: Colors.orangeAccent,
                    onPressed: () {
                      // Hành động chọn địa chỉ
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
