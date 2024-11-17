import 'package:flutter/material.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/model/order_model.dart';
import 'package:seafood_app/screens/widgets/vip_button.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
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
              title: const Text('Mã đơn hàng: TGHS21321'),
              subtitle: const Text('Ngày đặt: 12/12/2024'),
              trailing: Container(decoration:
                  BoxDecoration(
                    color: kOrangeColor,
                    borderRadius: BorderRadius.circular(8),
                  )
                  , child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text('Đang xử lý',
                        style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 10), textAlign: TextAlign.center,),
                  )),
            ),
            const ListTile(
              leading: Image(
                image: AssetImage('assets/images/logo.png'),
                width: 80,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text('Cá Hồi Nauy'),
              subtitle: Text('x 1'),
              trailing: Text('đ300.000'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22, top: 5, bottom: 10),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'Tổng số tiền (3 sản phẩm): '),
                    TextSpan(
                      text: 'đ1.000.000',
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
