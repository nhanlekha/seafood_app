

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:seafood_app/domans/repo/impl/cart_repo_impl.dart';
import '../../../domans/database_local/app_database.dart';
import '../../../model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsScreen({super.key, required this.productModel});

  void _showBottomNavigationBar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title and Cancel Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thêm Vào Giỏ Hàng",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              // Product Info Section
              Row(
                children: [
                  // Product Image
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4, // Optional: adds shadow for depth
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400]!,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        '${productModel.productImage}',
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: 20),
                  // Product Name, Price, and Quantity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productModel.productName}",
                        style: const TextStyle(fontSize: 17, color: Colors.black),
                        maxLines: 2,         // Limit text to 1 line
                        overflow: TextOverflow.ellipsis,  // Add ellipsis when the text overflows
                      ),


                      Text(
                        NumberFormat.currency(
                          locale: 'vi_VN',   // Set locale to Vietnam
                          symbol: '₫',       // Vietnamese currency symbol
                          decimalDigits: 0,   // Set decimal places to 0
                        ).format(double.tryParse('${productModel.productPrice}') ?? 0),  // Parse price to double and format
                        style: const TextStyle(fontSize: 15, color: Colors.red),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              // Decrease quantity action
                            },
                          ),
                          Text(
                            "0", // Quantity should be dynamic
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Increase quantity action
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Action Buttons
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFE4B5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bo góc (10dp)
                            side: BorderSide(
                              color: Color(0xFFb9a3a9), // Màu viền (stroke)
                              width: 1.0, // Độ dày viền (1dp)
                            ),
                          ),
                          elevation: 2, // Độ nổi (shadow)
                        ),
                        onPressed: () {

                        },
                        child: const Text('Mua ngay'),
                      ),
                    ),
                    const SizedBox(width: 16.0), // Khoảng cách giữa 2 nút
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFF80CBC4)), // Color tương ứng với material_deep_teal_200
                          side: MaterialStateProperty.all(const BorderSide(
                            color: Color(0xFFB9A3A9), // Màu border
                            width: 1.0, // Độ dày của đường viền
                          )),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Độ bo góc
                          )),
                        ),
                        onPressed:  () async {
                         final cartRepo = context.read<CartRepoImpl>();

                         if(await cartRepo.isProductInCart(productModel.productId!)){
                            print('product is exit !');
                         }else{

                           cartRepo.addCart(productId: productModel.productId! , customerId: 1, productName: productModel.productName!,
                               productPrice: productModel.productPrice!, productImage: productModel.productImage!, productQuantity: 1);

                         }

                         List<Cart> carts = await cartRepo.fetchAllCarts();
                         for (var cart in carts) {
                           print("Cart ID: ${cart.cartId}");
                         }
                         
                         
                        },
                        child: const Text('Thêm vào giỏ'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${productModel.productName}')),
      body: Stack(
        children: [
          Center(
            child: Text('Chi tiết sản phẩm: ${productModel.productName}'),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Xử lý sự kiện khi nhấn vào icon yêu thích
                            print('Icon yêu thích được nhấn');
                          },
                          child: const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                        const Text(
                          'Yêu thích',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFE4B5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Bo góc (10dp)
                          side: BorderSide(
                            color: Color(0xFFb9a3a9), // Màu viền (stroke)
                            width: 1.0, // Độ dày viền (1dp)
                          ),
                        ),
                        elevation: 2, // Độ nổi (shadow)
                      ),
                      onPressed: () => _showBottomNavigationBar(context),
                      child: const Text('Mua ngay'),
                    ),
                  ),
                  const SizedBox(width: 16.0), // Khoảng cách giữa 2 nút
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF80CBC4)), // Color tương ứng với material_deep_teal_200
                        side: MaterialStateProperty.all(const BorderSide(
                          color: Color(0xFFB9A3A9), // Màu border
                          width: 1.0, // Độ dày của đường viền
                        )),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Độ bo góc
                        )),
                      ),
                      onPressed: () => _showBottomNavigationBar(context),
                      child: const Text('Thêm vào giỏ'),
                    ),
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
