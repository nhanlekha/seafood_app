import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';


class CartItemWidget extends StatefulWidget {
  final Cart item;
  final Function(int) onDeleteItem;
  final Function(int,int) onQuantityChanged;
  final Function(int,bool) onCheckedChanged;


  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onDeleteItem,
    required this.onQuantityChanged,
    required this.onCheckedChanged,
  }) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.1,
              child: Checkbox(
                value: widget.item.checkedProduct, // Trạng thái checkbox
                onChanged: (bool? value) {
                  setState(() {
                      widget.onCheckedChanged(widget.item.cartId, value!);
                  });
                },
              ),
            ),
            // Hình ảnh sản phẩm
            Image.network(
              widget.item.productImage,
              width: screenWidth * 0.35,
              height: screenHeight * 0.15,
              fit: BoxFit.cover,
            ),
            // Thông tin sản phẩm
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.productName,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'vi_VN',   // Set locale to Vietnam
                        symbol: '₫',       // Vietnamese currency symbol
                        decimalDigits: 0,   // Set decimal places to 0
                      ).format(double.tryParse('${ widget.item.productPrice}') ?? 0),  // Parse price to double and format
                      style: const TextStyle(fontSize: 15, color: Colors.red),
                    ),
                    // Số lượng và các nút cộng trừ
                    Row(
                      children: [
                        // Nút trừ
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (widget.item.productQuantity > 1) {
                                widget.onQuantityChanged(widget.item.cartId, widget.item.productQuantity - 1); // Giảm số lượng
                              }
                            });
                          },
                        ),
                        // Số lượng
                        Text(
                          widget.item.productQuantity.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        // Nút cộng
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              widget.onQuantityChanged(widget.item.cartId, widget.item.productQuantity + 1); // Tăng số lượng
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Nút xóa
            Transform.translate(
              offset: const Offset(0, -35),
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  widget.onDeleteItem(widget.item.cartId); // Gọi hàm xóa sản phẩm
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
