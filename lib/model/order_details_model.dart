class OrderDetailsModel {
  int? orderDetailsId;
  String? orderCode;
  int? productId;
  String? productName;
  String? productPrice;
  String? productImage;
  int? categoryId;
  String? categoryName;
  int? productSalesQuantity;
  String? createdAt;
  String? updatedAt;

  OrderDetailsModel({
    this.orderDetailsId,
    this.orderCode,
    this.productId,
    this.productName,
    this.productPrice,
    this.productImage,
    this.categoryId,
    this.categoryName,
    this.productSalesQuantity,
    this.createdAt,
    this.updatedAt,
  });

  // Constructor từ JSON
  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderDetailsId = json['order_details_id'];
    orderCode = json['order_code'];
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    productSalesQuantity = json['product_sales_quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_details_id'] = orderDetailsId;
    data['order_code'] = orderCode;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_image'] = productImage;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['product_sales_quantity'] = productSalesQuantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
