import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:intl/intl.dart';  // Ensure this is imported for NumberFormat

import '../../routers/app_route_constants.dart';

class CheckoutCard extends StatelessWidget {
  final Cart cart;

  const CheckoutCard({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: Row(

        children: [
          // Product Image
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
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
                cart.productImage,
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Product Name, Price, and Quantity
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  cart.productName,
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,  // Ensures text is truncated
                ),
                const SizedBox(height: 5), // Added spacing between name and price
                // Product Price
                Text(
                  NumberFormat.currency(
                    locale: 'vi_VN',
                    symbol: '₫',
                    decimalDigits: 0,
                  ).format(double.tryParse('${cart.productPrice}') ?? 0),
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                ),
                const SizedBox(height: 10),
                // Product Quantity
                Text(
                  'Số lượng: ${cart.productQuantity}',
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
