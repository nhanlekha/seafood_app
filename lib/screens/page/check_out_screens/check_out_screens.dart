import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:seafood_app/domans/repo/impl/checkout_repo_impl.dart';
import 'package:seafood_app/model/coupon_model.dart';
import 'package:seafood_app/model/payment_model.dart';
import 'package:seafood_app/model/shipping_model.dart';
import 'package:seafood_app/screens/widgets/checkout_card.dart';

import '../../../domans/repo/impl/cart_repo_impl.dart';
import '../../widgets/toast_widget.dart';
import '../../widgets/vip_button.dart';


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double totalAmount = 0;
  double shippingFee = 0;
  double discountAmount = 0;
  double finalAmount = 0;

  List<Cart> listCart = [];
  late final CartRepoImpl cartRepo;

  @override
  void initState() {
    super.initState();
    cartRepo = context.read<CartRepoImpl>();
    loadProduct();
  }

  void loadProduct() async {
    listCart = await cartRepo.getCheckedCarts();

    if (listCart.isEmpty) {
      showToast(message: 'Không thấy sản phẩm !');
      context.pushReplacement('/cart');
    }
    totalAmount = await cartRepo.calculateTotalPrice();
    finalAmount = await cartRepo.calculateTotalPrice();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Thanh toán',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.chat_bubble_outline,
              color: kOrangeColor,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kOrangeColor,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShippingInfo(),
              _buildProductList(),
              _buildOptionRow(
                icon: 'assets/images/discounts.png',
                text: 'Nhập mã giảm giá',
                onTap: () {},
              ),
              _buildOptionRow(
                icon: 'assets/images/creditcard.png',
                text: 'Phương thức thanh toán',
                onTap: () {},
              ),
              _buildSummary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Tổng thanh toán: ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: '₫',
                            decimalDigits: 0,
                          ).format(finalAmount),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kOrangeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Tiết kiệm: ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: '₫',
                            decimalDigits: 0,
                          ).format(discountAmount),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kOrangeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            VipButton(
              onPressed: _checkOut,
              text: 'Đặt hàng',
              icon: Icons.shopping_bag_sharp,
              textColor: Colors.white,
              backgroundColor: kOrangeColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingInfo() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cột chứa icon
              const Column(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(width: 10), // Khoảng cách giữa icon và nội dung
              // Cột chứa nội dung
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Nguyện ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Màu chữ cho tên
                          ),
                        ),
                        TextSpan(
                          text: '(0123456789)',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Màu chữ cho số điện thoại
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '131, Trân Dư, Phường An Xuân, TP Tam Kỳ, Tỉnh Quảng Nam',
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis, // Tránh overflow
                    maxLines: 2, // Hiển thị tối đa 2 dòng
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(
      {required String icon,
      required String text,
      required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 24, width: 24),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildSummaryRow('Tổng tiền hàng:', totalAmount),
          _buildSummaryRow('Phí vận chuyển:', shippingFee),
          _buildSummaryRow('Giảm giá:', discountAmount),
          const Divider(
            thickness: 0.5,
          ),
          _buildSummaryRow(
            'Thành tiền:',
            finalAmount,
            isBold: true,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double value,
      {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color ?? Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            NumberFormat.currency(
                    locale: 'vi_VN', symbol: '₫', decimalDigits: 0)
                .format(value),
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    if (listCart.isEmpty) {
      return const Center(
        child: Text(
          'Không có sản phẩm trong giỏ hàng.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'THẾ GIỚI HẢI SẢN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leading: Image.asset('assets/images/logo.png', width: 40, height: 30, fit: BoxFit.cover,),
          ),
          ...listCart.map((cart) => CheckoutCard(cart: cart)).toList()
        ],
      ),
    );
  }

  void _checkOut() {
    PaymentModel paymentModel = PaymentModel();
    paymentModel.paymentMethod = 4;
    paymentModel.paymentStatus = 0;

    ShippingModel shippingModel = ShippingModel();
    shippingModel.shippingName = 'Nhan';
    shippingModel.shippingEmail = 'nhan@gmail.com';
    shippingModel.shippingPhone = 123;
    shippingModel.shippingAddress = 'DN';
    shippingModel.shippingNotes = 'Note';
    shippingModel.shippingSpecialRequirements = 1;
    shippingModel.shippingReceipt = 0;

    CouponModel couponModel = CouponModel();

    String orderCode = generateOrderCode();

    final checkoutRepo = context.read<CheckoutRepoImpl>();
    checkoutRepo.directPayment(
        orderCode: orderCode,
        totalPrice: finalAmount,
        deliveringFee: shippingFee,
        payment: paymentModel,
        shipping: shippingModel,
        cartList: listCart);

    listCart.forEach((list) {
      cartRepo.removeCart(list.cartId);
    });

    showToast(message: 'Đặt đơn hàng thành công !');
    context.pushReplacement('/');
  }

  String generateOrderCode() {
    int min = 1;
    int max = 9999;
    Random random = Random();
    int randomNumber = min + random.nextInt(max - min + 1);
    return 'FLUTTER${randomNumber.toString().padLeft(4, '0')}';
  }
}
