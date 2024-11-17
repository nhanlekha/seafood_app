import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:seafood_app/routers/app_route_config.dart';

import '../../../domans/repo/impl/cart_repo_impl.dart';
import '../../widgets/cart_card.dart';
import '../../widgets/toast_widget.dart';

class CartScreens extends StatelessWidget {
  const CartScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: CartPage());
  }
}



class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {
  bool _isCheckedAll = false;
  double _totalPrice = 0.0;
  late CartRepoImpl cartRepo;
  late List<Cart> listCart = [];

  void _re()async{
    listCart = await cartRepo.fetchAllCarts();
    _totalPrice = await cartRepo.calculateTotalPrice();
    setState(() {});
  }

  void _deleteItem(int id) async {
    await cartRepo.removeCart(id);
    _re();
  }

  void _updateChecked(int id, bool status) async {
    await cartRepo.updateProductChecked(id,status);
    _re();
  }



  Future<void> _updateQuantity(int id, int quantity) async {
    print(id);
    print(quantity);
    await cartRepo.updateProductQuantity(id, quantity);
    _re();
  }


  @override
  void initState() {
    // TODO: implement initState
     cartRepo = context.read<CartRepoImpl>();
     _loadCartItems();
    super.initState();
  }

  Future<void> _loadCartItems() async {
    _re();
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
            decoration: BoxDecoration(
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
          title: Text(
            'Giỏ Hàng', // Tiêu đề
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
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listCart.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    item: listCart[index],
                    onDeleteItem: _deleteItem,
                    onQuantityChanged: _updateQuantity,
                    onCheckedChanged: _updateChecked,
                  );
                },
              ),
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.all(6),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tổng Tiền: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'vi_VN',   // Set locale to Vietnam
                            symbol: '₫',       // Vietnamese currency symbol
                            decimalDigits: 0,   // Set decimal places to 0
                          ).format(double.tryParse('$_totalPrice') ?? 0),  // Parse price to double and format
                          style: const TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  // Buy Now Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onBuyNow, // Hàm xử lý sự kiện khi nhấn nút
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
                      child: Text(
                        'Mua Ngay',
                        style: TextStyle(
                          color: Colors.white, // Màu chữ
                          fontWeight: FontWeight.bold, // Đậm chữ
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Refresh function (for swipe to refresh)
  Future<void> _onRefresh() async {
    // Simulate a network request or any logic here
    await Future.delayed(const Duration(seconds: 2));
    setState(() {

    });
  }

  // Buy Now button action
  Future<void> _onBuyNow() async {
    // Implement your Buy Now logic here
    print('Buy Now clicked');
    listCart = await cartRepo.getCheckedCarts();
    if(!listCart.isEmpty){
      context.push('/check-out');

    }else{
      showToast(message:'Tích chọn sản phẩm cần thanh toán !');
    }

  }
}
