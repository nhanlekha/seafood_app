import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:seafood_app/domans/repo/impl/base_repo_impl.dart';
import 'package:seafood_app/model/coupon_model.dart';
import 'package:seafood_app/model/payment_model.dart';
import 'package:seafood_app/model/shipping_model.dart';

import '../../data_source/seafood_api.dart';
import '../../database_local/app_database.dart';
import '../base_repo.dart';

class CheckoutRepoImpl extends BaseRepoImpl{
  SeafoodApi seafoodApi;

  CheckoutRepoImpl({required this.seafoodApi}) : super(seafoodApi: seafoodApi);

  Future<void> directPayment({
    required String orderCode,
    required double totalPrice,
    required double deliveringFee,
    required PaymentModel payment,
    required ShippingModel shipping,
    required List<Cart> cartList,
    CouponModel? coupon,
  }) async {
    try {
      // Tạo FormData
      FormData formData = FormData.fromMap({
        'ordercode': orderCode,
        'totalprice': totalPrice,
        'deliveringfee': deliveringFee,
        'payment': jsonEncode(payment.toJson()),
        'shipping': jsonEncode(shipping.toJson()),
        'cart': jsonEncode(cartList.map((cart) => cart.toJson2()).toList()),
        'coupon': coupon != null ? jsonEncode(coupon.toJson()) : null,
      });

      // Gửi yêu cầu POST
      Response response = await seafoodApi.sendRequest.post(
        'android/put-order',
        data: formData,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == 200) {
        print('Order placed successfully: ${response.data}');
      } else {
        print('Failed to place order: ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('Network error: ${e.response?.statusCode} - ${e.response?.data}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }


}