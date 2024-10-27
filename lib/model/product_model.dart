import 'comment_model.dart';

class ProductModel {
  int? _productId;
  int? _categoryId;
  String? _categoryName;
  String? _productName;
  String? _productDesc;
  double? _productPrice;
  String? _productImage;
  String? _productUnit;
  int? _productUnitSold;
  int? _productStatus;
  int? _productViewer;
  String? _productContent;
  int? _productQuantity;
  String? _productDeliveryWay;
  String? _productOrigin;
  String? _productDeliciousFoods;
  List<CommentModel>? _commentList;
  String? _statusOrder;
  int? _flashSaleStatus;
  String? _createdAt;
  String? _updatedAt;

  ProductModel();

  ProductModel.withDetails(
      this._productId,
      this._categoryId,
      this._categoryName,
      this._productName,
      this._productDesc,
      this._productPrice,
      this._productImage,
      this._productUnit,
      this._productUnitSold,
      this._productStatus,
      this._productViewer,
      this._productContent,
      this._productQuantity,
      this._productDeliveryWay,
      this._productOrigin,
      this._productDeliciousFoods,
      this._commentList,
      this._statusOrder,
      this._flashSaleStatus,
      this._createdAt,
      this._updatedAt);

  // Constructor từ JSON
  ProductModel.fromJson(Map<String, dynamic> json) {
    _productId = json['product_id'];
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _productName = json['product_name'];
    _productDesc = json['product_desc'];
    _productPrice = json['product_price']?.toDouble();
    _productImage = json['product_image'];
    _productUnit = json['product_unit'];
    _productUnitSold = json['product_unit_sold'];
    _productStatus = json['product_status'];
    _productViewer = json['product_viewer'];
    _productContent = json['product_content'];
    _productQuantity = json['product_quantity'];
    _productDeliveryWay = json['product_deliveryway'];
    _productOrigin = json['product_origin'];
    _productDeliciousFoods = json['product_delicious_foods'];
    _statusOrder = json['status_order'];
    _flashSaleStatus = json['flashsale_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];

    // Chuyển đổi commentList từ JSON
    if (json['commentList'] != null) {
      _commentList = <CommentModel>[];
      json['commentList'].forEach((v) {
        _commentList!.add(CommentModel.fromJson(v));
      });
    }
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = _productId;
    data['category_id'] = _categoryId;
    data['category_name'] = _categoryName;
    data['product_name'] = _productName;
    data['product_desc'] = _productDesc;
    data['product_price'] = _productPrice;
    data['product_image'] = _productImage;
    data['product_unit'] = _productUnit;
    data['product_unit_sold'] = _productUnitSold;
    data['product_status'] = _productStatus;
    data['product_viewer'] = _productViewer;
    data['product_content'] = _productContent;
    data['product_quantity'] = _productQuantity;
    data['product_deliveryway'] = _productDeliveryWay;
    data['product_origin'] = _productOrigin;
    data['product_delicious_foods'] = _productDeliciousFoods;
    data['status_order'] = _statusOrder;
    data['flashsale_status'] = _flashSaleStatus;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;

    // Chuyển đổi commentList sang JSON
    if (_commentList != null) {
      data['commentList'] = _commentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Getter và Setter
  int? get productId => _productId;
  set productId(int? value) => _productId = value;

  int? get categoryId => _categoryId;
  set categoryId(int? value) => _categoryId = value;

  String? get categoryName => _categoryName;
  set categoryName(String? value) => _categoryName = value;

  String? get productName => _productName;
  set productName(String? value) => _productName = value;

  String? get productDesc => _productDesc;
  set productDesc(String? value) => _productDesc = value;

  double? get productPrice => _productPrice;
  set productPrice(double? value) => _productPrice = value;

  String? get productImage => _productImage;
  set productImage(String? value) => _productImage = value;

  String? get productUnit => _productUnit;
  set productUnit(String? value) => _productUnit = value;

  int? get productUnitSold => _productUnitSold;
  set productUnitSold(int? value) => _productUnitSold = value;

  int? get productStatus => _productStatus;
  set productStatus(int? value) => _productStatus = value;

  int? get productViewer => _productViewer;
  set productViewer(int? value) => _productViewer = value;

  String? get productContent => _productContent;
  set productContent(String? value) => _productContent = value;

  int? get productQuantity => _productQuantity;
  set productQuantity(int? value) => _productQuantity = value;

  String? get productDeliveryWay => _productDeliveryWay;
  set productDeliveryWay(String? value) => _productDeliveryWay = value;

  String? get productOrigin => _productOrigin;
  set productOrigin(String? value) => _productOrigin = value;

  String? get productDeliciousFoods => _productDeliciousFoods;
  set productDeliciousFoods(String? value) => _productDeliciousFoods = value;

  List<CommentModel>? get commentList => _commentList;
  set commentList(List<CommentModel>? value) => _commentList = value;

  String? get statusOrder => _statusOrder;
  set statusOrder(String? value) => _statusOrder = value;

  int? get flashSaleStatus => _flashSaleStatus;
  set flashSaleStatus(int? value) => _flashSaleStatus = value;

  String? get createdAt => _createdAt;
  set createdAt(String? value) => _createdAt = value;

  String? get updatedAt => _updatedAt;
  set updatedAt(String? value) => _updatedAt = value;
}
