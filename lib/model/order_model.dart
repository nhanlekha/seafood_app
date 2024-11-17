import 'package:seafood_app/model/payment_model.dart';
import 'package:seafood_app/model/shipping_model.dart';

import 'order_details_model.dart';

class OrderModel {
  int? orderId;
  int? customerId;
  int? shippingId;
  int? paymentId;
  int? orderStatus;
  String? orderCode;
  int? productFee;
  String? productCoupon;
  int? productPriceCoupon;
  int? totalPrice;
  int? totalQuantity;
  String? orderDate;
  ShippingModel? shipping;
  PaymentModel? payment;
  List<OrderDetailsModel>? orderDetails;
  String? createdAt;
  String? updatedAt;

  OrderModel({
    this.orderId,
    this.customerId,
    this.shippingId,
    this.paymentId,
    this.orderStatus,
    this.orderCode,
    this.productFee,
    this.productCoupon,
    this.productPriceCoupon,
    this.totalPrice,
    this.totalQuantity,
    this.orderDate,
    this.shipping,
    this.payment,
    this.orderDetails,
    this.createdAt,
    this.updatedAt,
  });

  // Constructor từ JSON
  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerId = json['customer_id'];
    shippingId = json['shipping_id'];
    paymentId = json['payment_id'];
    orderStatus = json['order_status'];
    orderCode = json['order_code'];
    productFee = json['product_fee'];
    productCoupon = json['product_coupon'];
    productPriceCoupon = json['product_price_coupon'];
    totalPrice = json['total_price'];
    totalQuantity = json['total_quantity'];
    orderDate = json['order_date'];
    shipping = json['shipping'] != null ? ShippingModel.fromJson(json['shipping']) : null;
    payment = json['payment'] != null ? PaymentModel.fromJson(json['payment']) : null;
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetailsModel>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(OrderDetailsModel.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['customer_id'] = customerId;
    data['shipping_id'] = shippingId;
    data['payment_id'] = paymentId;
    data['order_status'] = orderStatus;
    data['order_code'] = orderCode;
    data['product_fee'] = productFee;
    data['product_coupon'] = productCoupon;
    data['product_price_coupon'] = productPriceCoupon;
    data['total_price'] = totalPrice;
    data['total_quantity'] = totalQuantity;
    data['order_date'] = orderDate;
    if (shipping != null) {
      data['shipping'] = shipping!.toJson();
    }
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

