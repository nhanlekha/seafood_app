import 'dart:math';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:seafood_app/domans/repo/impl/checkout_repo_impl.dart';
import 'package:seafood_app/model/coupon_model.dart';
import 'package:seafood_app/model/payment_model.dart';
import 'package:seafood_app/model/shippingmodel.dart';
import 'package:seafood_app/routers/app_route_config.dart';
import 'package:seafood_app/screens/widgets/checkout_card.dart';

import '../../../domans/repo/impl/cart_repo_impl.dart';
import '../../../ultils/ultils/ultils.dart';
import '../../widgets/cart_card.dart';
import '../../widgets/toast_widget.dart';
import '../../widgets/vip_button.dart';


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double totalAmount = 0; // Tổng tiền hàng
  double shippingFee = 0;  // Phí vận chuyển
  double discountAmount = 0; // Giảm giá
  double finalAmount = 0; // Thành tiền

  List<Cart> listCart = [];
  late final CartRepoImpl cartRepo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartRepo = context.read<CartRepoImpl>();
    loadProduct();
  }
  void loadProduct() async{

    listCart = await cartRepo.getCheckedCarts();

    if(listCart.isEmpty){
      showToast(message:'Không thấy sản phẩm !');
      context.pushReplacement('/cart');
    }
    totalAmount = await cartRepo.calculateTotalPrice();
    finalAmount = await cartRepo.calculateTotalPrice();

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.transparent, // Để nền trong suốt để áp dụng gradient
          elevation: 0, // Để không có shadow
          automaticallyImplyLeading: false, // Tắt mặc định của leading
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF12c2e9), // Đầu gradient (star_color)
                  Color(0xFFc471ed), // Màu giữa gradient (mid_color)
                  Color(0xFFf46f59), // Cuối gradient (end_color)
                ],
                stops: [0.0, 0.5, 1.0], // Điều chỉnh vị trí các màu
              ),
            ),
          ),
          title: const Text(
            'Thanh Toán', // Tiêu đề
            style: TextStyle(
              fontSize: 22, // Kích thước chữ
              fontWeight: FontWeight.bold, // Chữ đậm
              color: Colors.black, // Màu chữ trắng
              letterSpacing: 1.2, // Khoảng cách giữa các chữ
            ),
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/images/undo24x24.png', // Đường dẫn đến ảnh trong thư mục assets
              height: 24, // Điều chỉnh kích thước của ảnh
              width: 24, // Điều chỉnh kích thước của ảnh
            ), // Biểu tượng undo tương đương với drawable "undo24x24"
            onPressed: () {
              // Thực hiện hành động khi nhấn nút
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          // Mặt hàng
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/product.png', // Path to image in assets
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Mặt hàng',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    shrinkWrap: true,  // Prevents ListView from taking up infinite space
                    itemCount: listCart.length ?? 0,
                    itemBuilder: (context, index) {
                      return CheckoutCard(cart: listCart[index]);
                      //return CartItemWidget(item: listCart[index], onDeleteItem: (int ) {  }, onQuantityChanged: _haa, onCheckedChanged: (int , bool ) {  },);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Thông tin khách hàng
         Visibility(
            visible: true, // Sẽ ẩn/hiện thông tin tuỳ vào điều kiện
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/place.png', // Đường dẫn đến ảnh trong thư mục assets
                        height: 24, // Điều chỉnh kích thước của ảnh
                        width: 24, // Điều chỉnh kích thước của ảnh
                      ),
                      const SizedBox(width: 5),
                      const Text('Địa chỉ mặc định', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 5),

                   Row(
                    children: [
                      Image.asset(
                        'assets/images/man.png', // Đường dẫn đến ảnh trong thư mục assets
                        height: 24, // Điều chỉnh kích thước của ảnh
                        width: 24, // Điều chỉnh kích thước của ảnh
                      ),
                      SizedBox(width: 5),
                      Text('Nguyên đẹp trai (0839519415)', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/map.png', // Đường dẫn đến ảnh trong thư mục assets
                        height: 24, // Điều chỉnh kích thước của ảnh
                        width: 24, // Điều chỉnh kích thước của ảnh
                      ),
                      SizedBox(width: 5),
                      Expanded(child: Text('131, Trân Dư, Phường An Xuân, TP Tam Kỳ, Tỉnh Quảng Nam', style: TextStyle(fontSize: 14))),
                    ],
                  ),

                ],
              ),
            ),
          ),


          Divider(
            color: Colors.grey[300], // Màu xám nhẹ
            thickness: 1, // Độ dày của gạch ngang
            indent: 5, // Khoảng cách từ lề trái
            endIndent: 5, // Khoảng cách từ lề phải
          ),

          // Nhập mã giảm giá
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/discounts.png', // Đường dẫn đến ảnh trong thư mục assets
                  height: 24, // Điều chỉnh kích thước của ảnh
                  width: 24, // Điều chỉnh kích thước của ảnh
                ),
                const SizedBox(width: 10),
                const Text(
                  'Nhập mã giảm giá',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),

          Divider(
            color: Colors.grey[300], // Màu xám nhẹ
            thickness: 1, // Độ dày của gạch ngang
            indent: 5, // Khoảng cách từ lề trái
            endIndent: 5, // Khoảng cách từ lề phải
          ),


          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/creditcard.png', // Đường dẫn đến ảnh trong thư mục assets
                  height: 24, // Điều chỉnh kích thước của ảnh
                  width: 24, // Điều chỉnh kích thước của ảnh
                ),
                const SizedBox(width: 10),
                const Text(
                  'Phương thức thanh toán',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),

          Divider(
            color: Colors.grey[300], // Màu xám nhẹ
            thickness: 1, // Độ dày của gạch ngang
            indent: 5, // Khoảng cách từ lề trái
            endIndent: 5, // Khoảng cách từ lề phải
          ),

          // Thông tin thanh toán
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Tổng tiền hàng:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                    locale: 'vi_VN',   // Set locale to Vietnam
    symbol: '₫',       // Vietnamese currency symbol
    decimalDigits: 0,   // Set decimal places to 0
    ).format(double.tryParse('$totalAmount') ?? 0), style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Phí vận chuyển:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
    locale: 'vi_VN',   // Set locale to Vietnam
    symbol: '₫',       // Vietnamese currency symbol
    decimalDigits: 0,   // Set decimal places to 0
    ).format(double.tryParse('$shippingFee') ?? 0), style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Giảm giá:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
    locale: 'vi_VN',   // Set locale to Vietnam
    symbol: '₫',       // Vietnamese currency symbol
    decimalDigits: 0,   // Set decimal places to 0
    ).format(double.tryParse('$discountAmount') ?? 0), style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Thành tiền:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
    locale: 'vi_VN',   // Set locale to Vietnam
    symbol: '₫',       // Vietnamese currency symbol
    decimalDigits: 0,   // Set decimal places to 0
    ).format(double.tryParse('$finalAmount') ?? 0), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              VipButton(
                onPressed: () => (){},
                icon: Icons.cancel,
                textColor: Colors.white,
                backgroundColor: Colors.deepOrangeAccent,
                text: 'Hủy',
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: VipButton(
                  onPressed: _checkOut,
                  text: 'Mua ngay',
                  icon: Icons.shopping_bag_rounded,
                  textColor: Colors.white,
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkOut(){
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

     String  orderCode = generateOrderCode();

     final checkoutRepo = context.read<CheckoutRepoImpl>();
     checkoutRepo.directPayment(orderCode: orderCode, totalPrice: finalAmount, deliveringFee: shippingFee, payment: paymentModel, shipping: shippingModel, cartList: listCart);

     listCart.forEach((list) {
       cartRepo.removeCart(list.cartId);
     });

     showToast(message: 'Đặt đơn hàng thành công !');
     context.pushReplacement('/');

  }

  String generateOrderCode() {
    int min = 1; // Không dùng 0001 vì Dart sẽ tự bỏ các số 0 ở đầu
    int max = 9999;
    Random random = Random();
    int randomNumber = min + random.nextInt(max - min + 1);
    return 'FLUTTER${randomNumber.toString().padLeft(4, '0')}'; // Đảm bảo có đủ 4 chữ số
  }

}
