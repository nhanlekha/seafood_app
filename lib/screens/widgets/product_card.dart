import 'package:easy_localization/easy_localization.dart';
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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
          onTap: () {
            context.push(
              RouteConstants.detailsProductRoute,
              extra: productModel,
            );
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () {
              context.push(
                RouteConstants.detailsProductRoute,
                extra: productModel,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hình ảnh sản phẩm
                Stack(
                  children: [
                    Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productModel.productImage ?? ""),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // sale
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: const BoxDecoration(
                          color: Color(0xfffaeded),
                        ),
                        child: const Text(
                          "-21%",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0Xffee694e),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Text(
                                "Mới",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: Text(
                                productModel.productName ?? "",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'vi_VN', // Set locale to Vietnam
                                customPattern: '₫###,###,###,###', // Custom pattern
                                symbol: '₫', // Vietnamese currency symbol
                                decimalDigits: 0, // Set decimal places to 0
                              ).format(double.tryParse(
                                      '${productModel.productPrice}') ??
                                  0),
                              // Parse price to double and format
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.red),
                            ),
                            const SizedBox(width: 4.0),
                            // const Icon(
                            //   Icons.local_shipping_outlined,
                            //   color: Colors.green,
                            //   size: 8.0,
                            // ),
                            const Icon(
                              Icons.verified_user,
                              color: Colors.green,
                              size: 16.0,
                            ),
                            const Spacer(),
                            Text(
                              "Đã bán ${productModel.productUnitSold}",
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
