import 'package:flutter/material.dart';
import 'package:seafood_app/domans/data_source/seafood_api.dart';
import 'package:seafood_app/model/city_model.dart';
import 'package:seafood_app/model/province_model.dart';
import 'package:seafood_app/model/wards_model.dart';
import 'package:seafood_app/screens/widgets/vip_button.dart';

import '../../../domans/repo/impl/address_repo_impl.dart';

class AddAddressScreens extends StatefulWidget {
  const AddAddressScreens({super.key});

  @override
  State<AddAddressScreens> createState() => _AddAddressScreensState();
}

class _AddAddressScreensState extends State<AddAddressScreens> {
  bool isDefaultAddress = false;

  final TextEditingController addressNameController = TextEditingController();
  final TextEditingController recipientNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();

  List<CityModel> cities = [];
  List<ProvinceModel> districts = [];
  List<WardModel> wards = [];
  CityModel? selectedCity;
  ProvinceModel? selectedDistrict;
  WardModel? selectedWard;

  final addressRepo = AddressRepoImpl(seafoodApi: SeafoodApi());

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  Future<void> fetchCities() async {
    try {
      final cityList = await addressRepo.fetchListCity();
      setState(() {
        cities = cityList;
      });
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }

  Future<void> fetchDistricts(CityModel city) async {
    try {
      final districtList = await addressRepo.fetchListProvincesByCity(city);
      setState(() {
        districts = districtList;
      });
    } catch (e) {
      print('Error fetching districts: $e');
    }
  }

  Future<void> fetchWards(ProvinceModel district) async {
    try {
      final wardList = await addressRepo.fetchListWardByProvince(district);
      setState(() {
        wards = wardList;
      });
    } catch (e) {
      print('Error fetching wards: $e');
    }
  }

  @override
  void dispose() {
    addressNameController.dispose();
    recipientNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    houseNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thêm Địa Chỉ',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TextField(
                      controller: addressNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nhập Tên Địa Chỉ',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: recipientNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nhập Tên Người Nhận Hàng',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Nhập Số Điện Thoại',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Nhập Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<CityModel>(
                      value: selectedCity,
                      decoration: const InputDecoration(
                        labelText: 'Tỉnh Thành Phố',
                        border: OutlineInputBorder(),
                      ),
                      items: cities.map((CityModel value) {
                        return DropdownMenuItem<CityModel>(
                          value: value,
                          child: Text(value.nameCity ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                          selectedDistrict = null;
                          districts = [];
                          wards = [];
                        });
                        if (value != null) {
                          fetchDistricts(value);
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<ProvinceModel>(
                      value: selectedDistrict,
                      decoration: const InputDecoration(
                        labelText: 'Quận Huyện',
                        border: OutlineInputBorder(),
                      ),
                      items: districts.map((ProvinceModel value) {
                        return DropdownMenuItem<ProvinceModel>(
                          value: value,
                          child: Text(value.nameProvince ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value;
                          selectedWard = null;
                          wards = [];
                        });
                        if (value != null) {
                          fetchWards(value);
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<WardModel>(
                      value: selectedWard,
                      decoration: const InputDecoration(
                        labelText: 'Xã Phường Thị Trấn',
                        border: OutlineInputBorder(),
                      ),
                      items: wards.map((WardModel value) {
                        return DropdownMenuItem<WardModel>(
                          value: value,
                          child: Text(value.nameWard ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedWard = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: houseNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Nhập Số Nhà',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Đặt Làm Địa Chỉ Mặt Định'),
                        Switch(
                          value: isDefaultAddress,
                          onChanged: (value) {
                            setState(() {
                              isDefaultAddress = value;
                            });
                          },
                          activeColor: Colors.teal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            VipButton(
              icon: Icons.save,
              text: 'Lưu Địa Chỉ',
              textColor: Colors.white,
              backgroundColor: Colors.blue,
              onPressed: () {
                // Hành động lưu địa chỉ
                print('Address: ${addressNameController.text}');
                print('Recipient: ${recipientNameController.text}');
                print('Phone: ${phoneController.text}');
                print('Email: ${emailController.text}');
                print('City: ${selectedCity?.nameCity}');
                print('District: ${selectedDistrict?.nameProvince}');
                print('Ward: ${selectedWard?.nameWard}');
                print('House Number: ${houseNumberController.text}');
                print('Is Default: $isDefaultAddress');
              },
            ),
          ],
        ),
      ),
    );
  }
}