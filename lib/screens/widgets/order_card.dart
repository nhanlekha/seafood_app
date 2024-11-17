import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/model/order_model.dart';
import 'package:seafood_app/screens/widgets/vip_button.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

   OrderCard({super.key, required this.order});
  String status = '';
  Color statusColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    switch (order.orderStatus) {
      case 1:
        status = 'Đang chờ xác nhận';
        statusColor = Colors.orange;
        break;
      case 2:
        status = 'Đang giao';
        statusColor = Colors.blue;
        break;
      case 3:
        status = 'Hoàn thành';
        statusColor = Colors.green;
        break;
      case 4:
        status = 'Đã huỷ';
        statusColor = Colors.red;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              leading: const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 40,
                  height: 30,
                  fit: BoxFit.cover),
              title: Text('${order.orderCode}'),
              subtitle: Text('${order.orderDate}'),
              trailing: Container(
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      status,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            ListTile(
              leading: ClipOval(
                child: Image(
                  image: Image.network(
                    order.orderDetails?[0].productImage ?? '',
                  ).image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                
                ),
              ),
              title: Text(order.orderDetails?[0].productName ?? 'Hải sản'),
              subtitle:
                  Text('x ${order.orderDetails?[0].productSalesQuantity ?? 0}'),
              trailing: Text(NumberFormat.currency(
                locale: 'vi_VN',
                // Set locale to Vietnam
                customPattern: '₫###,###,###,###',
                // Custom pattern
                symbol: '₫',
                // Vietnamese currency symbol
                decimalDigits: 0, // Set decimal places to 0
              ).format(double.tryParse(
                  '${order.orderDetails?[0].productPrice}') ??
                  0)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22, top: 5, bottom: 10),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text:
                            'Tổng số tiền (${order.orderDetails?.length} sản phẩm): '),
                    TextSpan(
                      text:                       NumberFormat.currency(
                        locale: 'vi_VN',
                        // Set locale to Vietnam
                        customPattern: '₫###,###,###,###',
                        // Custom pattern
                        symbol: '₫',
                        // Vietnamese currency symbol
                        decimalDigits: 0, // Set decimal places to 0
                      ).format(double.tryParse(
                          '${order.totalPrice}') ??
                          0),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: OverflowBar(
            //     alignment: MainAxisAlignment.end,
            //     children: [
            //       VipButton(
            //         onPressed: () {},
            //         icon: Icons.cancel,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.redAccent,
            //         text: 'Hủy Đơn',
            //         borderRadius: 10,
            //       ),
            //       const SizedBox(width: 10),
            //       VipButton(
            //         onPressed: () {},
            //         icon: Icons.forward,
            //         textColor: Colors.white,
            //         backgroundColor: Colors.green,
            //         text: 'Chi Tiết',
            //         borderRadius: 10,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
