import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/model/product_model.dart';

import '../../routers/app_route_constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RouteConstants.detailsProductRoute,
          extra: productModel,
        );
      },
      child: Card(
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
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                    child: Image.network(
                      '${productModel.productImage}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 135.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${productModel.productName}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '${productModel.categoryName}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${productModel.productViewer}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Image.asset(
                        'assets/images/check.png',
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '(5 Đánh giá)',
                        style: const TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${productModel.statusOrder}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.greenAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${productModel.productPrice}',
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
                        '${productModel.productUnit}',
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
                "assets/images/hotproduct.png",
                width: 30.0,
                height: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
