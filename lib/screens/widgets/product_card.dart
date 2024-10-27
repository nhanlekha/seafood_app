import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.productName,
    required this.categoryName,
    required this.rating,
    required this.reviewCount,
    required this.orderStatus,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.iconUrl,
  }) : super(key: key);

  final String productName;
  final String categoryName;
  final int rating;
  final int reviewCount;
  final String orderStatus;
  final String price;
  final String unit;
  final String imageUrl;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0), // Bo góc trên cùng bên trái
                      topRight: Radius.circular(5.0), // Bo góc trên cùng bên phải
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 135.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      productName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    categoryName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$rating',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Image.asset(
                        'assets/images/check.png', // Thay đổi đường dẫn đến hình ảnh sao
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '($reviewCount Đánh giá)',
                        style: const TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      orderStatus,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.greenAccent, // Thay đổi để phù hợp với background gradient
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '/',
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        unit,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 4.0,
              right: 4.0,
              child: Image.asset(
                iconUrl,
                width: 30.0,
                height: 30.0,
              ),
            ),
          ],
      ),
    );
  }
}
