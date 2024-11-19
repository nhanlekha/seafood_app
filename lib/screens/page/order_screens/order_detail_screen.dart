import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/model/order_model.dart';

class OrderDetailScreen extends StatefulWidget {
  final OrderModel orderModel;

  const OrderDetailScreen({super.key, required this.orderModel});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    String status = '';
    Color statusColor = Colors.black;

    switch (widget.orderModel.orderStatus) {
      case 0:
        status = 'đang chờ xác nhận';
        statusColor = Colors.orange;
        break;
      case 1:
        status = 'đang giao';
        statusColor = Colors.blue;
        break;
      case -1:
      case 3:
        status = 'đã huỷ';
        statusColor = Colors.red;
        break;
      case 4:
      case 2:
        status = 'đã hoàn thành';
        statusColor = Colors.green;
        break;
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Thông tin đơn hàng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: statusColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Đơn hàng ${status}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png',
                      width: 100, height: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mã đơn hàng: ${widget.orderModel.orderCode}'),
                      Text('Ngày đặt hàng: ${widget.orderModel.orderDate}'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text:
                                      '${widget.orderModel.shipping?.shippingName}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text:
                                      ' (${widget.orderModel.shipping?.shippingPhone})',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${widget.orderModel.shipping?.shippingAddress}',
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: widget.orderModel.orderDetails?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.orderModel.orderDetails?[index].productImage ??
                              '',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      title: Text(
                          widget.orderModel.orderDetails?[index].productName ??
                              ''),
                      subtitle: Text(
                          'x ${widget.orderModel.orderDetails?[index].productSalesQuantity}'),
                      trailing: Text(
                        NumberFormat.currency(
                          locale: 'vi_VN',
                          customPattern: '₫###,###,###,###',
                          symbol: '₫',
                          decimalDigits: 0,
                        ).format(double.tryParse(
                                '${widget.orderModel.orderDetails?[index].productPrice}') ??
                            0),
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14)
                        ,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text:
                              'Tổng số tiền (${widget.orderModel.orderDetails?.length} sản phẩm): '),
                      TextSpan(
                        text: NumberFormat.currency(
                          locale: 'vi_VN',
                          // Set locale to Vietnam
                          customPattern: '₫###,###,###,###',
                          // Custom pattern
                          symbol: '₫',
                          // Vietnamese currency symbol
                          decimalDigits: 0, // Set decimal places to 0
                        ).format(double.tryParse(
                                '${widget.orderModel.totalPrice}') ??
                            0),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
