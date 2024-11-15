import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/screens/widgets/vip_button.dart';
import 'package:seafood_app/screens/widgets/address_card.dart';

import '../../../domans/database_local/app_database.dart';
import '../../../domans/repo/address_personal_repo.dart';
import '../../../domans/repo/impl/address_personal_repo_impl.dart';
import 'add_address_screens.dart';

class AddressScreens extends StatefulWidget {
  const AddressScreens({super.key});

  @override
  State<AddressScreens> createState() => _AddressScreensState();
}

class _AddressScreensState extends State<AddressScreens> {
  late Future<List<AddressPersonal>> _listAddressPersonal;
  final _addressPersonalRepo = AddressPersonalRepoImpl();

  @override
  void initState() {
    super.initState();
    _fetchListAddressPersonalData();
  }

  void _fetchListAddressPersonalData() {
    setState(() {
      _listAddressPersonal = _addressPersonalRepo.fetchListAddressPersonal(1);
    });
  }

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildAddressList(),
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
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddAddressScreens()),
                      );
                      _fetchListAddressPersonalData();
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

  Widget _buildAddressList() {
    return FutureBuilder(
      future: _listAddressPersonal,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text(
                  "Bạn chưa có địa chỉ nào!\nThêm địa chỉ nhận hàng ngay"));
        } else {
          List<AddressPersonal> listAddressPersonal =
              snapshot.data as List<AddressPersonal>;

          // Sort the list to bring the default address to the top
          listAddressPersonal.sort((a, b) => b.isChecked ? 1 : -1);

          return Column(
            children: listAddressPersonal.map((addressPersonal) {
              return Dismissible(
                key: ValueKey(addressPersonal.dressPersonalId),
                direction: DismissDirection.endToStart,
                resizeDuration: const Duration(milliseconds: 500),
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.redAccent,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    final bool isConfirmed = await showDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Xác nhận'),
                        content: const Text(
                            'Bạn có chắc chắn muốn xóa địa chỉ này không?'),
                        actions: [
                          TextButton(
                            onPressed: () => {
                              Navigator.pop(context, false),
                            },
                            child: const Text('Không'),
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.pop(context, true),
                              _addressPersonalRepo.removeAddressPersonal(
                                  addressPersonal.dressPersonalId),
                            },
                            child: const Text('Có',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                    _fetchListAddressPersonalData();
                  }
                },
                child: GestureDetector(
                  onTap: () async {
                    // TODO: Edit address
                  },
                  child: AddressCard(
                    title: addressPersonal.nameDress,
                    shippingName: addressPersonal.shippingName,
                    shippingPhone: addressPersonal.shippingPhone,
                    addressDetails: '${addressPersonal.homeNumber} \n'
                        '${addressPersonal.wardName}, ${addressPersonal.provinceName}, ${addressPersonal.cityName}',
                    isDefault: addressPersonal.isChecked,
                    onDefaultChanged: (bool newValue) {
                      // Handle setting default address if needed
                    },
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
