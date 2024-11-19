import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';

class CartItemWidget extends StatefulWidget {
  final Cart item;
  final Function(int) onDeleteItem;
  final Function(int, int) onQuantityChanged;
  final Function(int, bool) onCheckedChanged;

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

    return Container(
      height: 120,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            activeColor: kOrangeColor,
            value: widget.item.checkedProduct,
            onChanged: (bool? value) {
              setState(() {
                widget.onCheckedChanged(widget.item.cartId, value!);
              });
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.item.productImage,
                width: screenWidth * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.item.productName,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'vi_VN',
                        symbol: '₫',
                        decimalDigits: 0,
                      ).format(
                          double.tryParse('${widget.item.productPrice}') ?? 0),
                      style: const TextStyle(fontSize: 15, color: Colors.red),
                    ),
                    Row(
                      children: [
                        // Nút giảm số lượng
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (widget.item.productQuantity > 1) {
                                widget.onQuantityChanged(widget.item.cartId,
                                    widget.item.productQuantity - 1);
                              }
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: const Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                  width: 0.1,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 0.1,
                                ),
                                left: BorderSide(
                                  color: Colors.grey,
                                  width: 0.1,
                                ),
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400, width: 0.1),
                            color: Colors.white,
                          ),
                          child: Text(
                            widget.item.productQuantity.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Nút tăng số lượng
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.onQuantityChanged(widget.item.cartId,
                                  widget.item.productQuantity + 1);
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: kToastColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Transform.translate(
          //   offset: const Offset(0, -35),
          //   child: IconButton(
          //     icon: const Icon(Icons.cancel),
          //     onPressed: () {
          //       widget.onDeleteItem(widget.item.cartId);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
