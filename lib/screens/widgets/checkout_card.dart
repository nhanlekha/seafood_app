import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:intl/intl.dart';

class CheckoutCard extends StatelessWidget {
  final Cart cart;

  const CheckoutCard({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          cart.productImage,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        cart.productName,
      ),
      subtitle: Text('x ${cart.productQuantity}'),
      trailing: Text(
        NumberFormat.currency(
          locale: 'vi_VN',
          customPattern: '₫###,###,###,###',
          symbol: '₫',
          decimalDigits: 0,
        ).format(double.tryParse('${cart.productPrice}') ?? 0),
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
    );
  }
}
