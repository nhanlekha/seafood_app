import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';

import '../../../domans/repo/impl/cart_repo_impl.dart';
import '../../widgets/cart_card.dart';
import '../../widgets/toast_widget.dart';

class CartScreens extends StatelessWidget {
  const CartScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CartPage();
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

  void _re() async {
    listCart = await cartRepo.fetchAllCarts();
    _totalPrice = await cartRepo.calculateTotalPrice();
    setState(() {});
  }

  void _deleteItem(int id) async {
    await cartRepo.removeCart(id);
    _re();
  }

  void _updateChecked(int id, bool status) async {
    await cartRepo.updateProductChecked(id, status);
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
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Giỏ hàng',
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
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: FadeInDown(
                child: ListView.builder(
                  itemCount: listCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = listCart[index];
                    return Slidable(
                      key: ValueKey(cartItem.cartId),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) =>
                                _deleteItem(cartItem.cartId),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Xóa',
                          ),
                        ],
                      ),
                      child: CartItemWidget(
                        item: cartItem,
                        onDeleteItem: _deleteItem,
                        onQuantityChanged: _updateQuantity,
                        onCheckedChanged: _updateChecked,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tổng thanh toán: ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: '₫',
                            decimalDigits: 0,
                          ).format(double.tryParse('$_totalPrice') ?? 0),
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _onBuyNow,

                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(
                        Size(150, MediaQuery.of(context).size.height * 0.08),
                      )
                      ,
                      backgroundColor: WidgetStateProperty.all(kOrangeColor),
                      shape: WidgetStateProperty.all(
                        LinearBorder.none,
                      ),
                    ),
                    child: const Text(
                      'Mua Ngay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  Future<void> _onBuyNow() async {
    listCart = await cartRepo.getCheckedCarts();
    if (!listCart.isEmpty) {
      context.push('/check-out');
    } else {
      showToast(message: 'Bạn vẫn chưa chọn sản phẩm nào để mua');
    }
  }
}
