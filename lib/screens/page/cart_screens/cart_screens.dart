import 'package:flutter/material.dart';

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

  // Sample data for the cart items
  final List<String> _cartItems = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4A90E2), Color(0xFF50A7E4)], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: SizedBox.shrink(), // No title for this toolbar
          leading: IconButton(
            icon: Icon(Icons.undo),
            onPressed: () {
              Navigator.pop(context);
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
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_cartItems[index]),
                    trailing: Icon(Icons.delete),
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(6),
              child: Row(
                children: [
                  // Checkbox Section
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isCheckedAll,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedAll = value ?? false;
                            });
                          },
                        ),

                      ],
                    ),
                  ),
                  // Total Price Section
                  Expanded(
                    flex: 2,
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
                          '${_totalPrice.toStringAsFixed(0)}k',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Buy Now Button
                  Expanded(
                    flex: 2,
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
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _totalPrice = 200.0; // Example of updating total price
    });
  }

  // Buy Now button action
  void _onBuyNow() {
    // Implement your Buy Now logic here
    print('Buy Now clicked');
  }
}
