class CouponModel {
  int? couponId;
  String? couponName;
  String? couponNameCode;
  String? couponDesc;
  int? couponQtyCode;
  int? couponCondition;
  double? couponPriceSale;
  String? couponStartDate;
  String? couponEndDate;
  String? createdAt;
  String? updatedAt;

  CouponModel({
    this.couponId,
    this.couponName,
    this.couponNameCode,
    this.couponDesc,
    this.couponQtyCode,
    this.couponCondition,
    this.couponPriceSale,
    this.couponStartDate,
    this.couponEndDate,
    this.createdAt,
    this.updatedAt,
  });

  // Constructor từ JSON
  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponNameCode = json['coupon_name_code'];
    couponDesc = json['coupon_desc'];
    couponQtyCode = json['coupon_qty_code'];
    couponCondition = json['coupon_condition'];
    couponPriceSale = json['coupon_price_sale'];
    couponStartDate = json['coupon_start_date'];
    couponEndDate = json['coupon_end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_name_code'] = couponNameCode;
    data['coupon_desc'] = couponDesc;
    data['coupon_qty_code'] = couponQtyCode;
    data['coupon_condition'] = couponCondition;
    data['coupon_price_sale'] = couponPriceSale;
    data['coupon_start_date'] = couponStartDate;
    data['coupon_end_date'] = couponEndDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
