class CategoryModel {
  int? _categoryId;
  String? _categoryName;
  String? _categoryImage;
  String? _categoryDesc;
  int? _categoryStatus;
  String? _createdAt;
  String? _updatedAt;

  CategoryModel({
    int? categoryId,
    String? categoryName,
    String? categoryImage,
    String? categoryDesc,
    int? categoryStatus,
    String? createdAt,
    String? updatedAt,
  }) {
    _categoryId = categoryId;
    _categoryName = categoryName;
    _categoryImage = categoryImage;
    _categoryDesc = categoryDesc;
    _categoryStatus = categoryStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  // Constructor từ JSON
  CategoryModel.fromJson(Map<String, dynamic> json) {
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _categoryImage = json['category_image'];
    _categoryDesc = json['category_desc'];
    _categoryStatus = json['category_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category_id'] = _categoryId;
    data['category_name'] = _categoryName;
    data['category_image'] = _categoryImage;
    data['category_desc'] = _categoryDesc;
    data['category_status'] = _categoryStatus;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }

  // Getters
  int? get categoryId => _categoryId;
  String? get categoryName => _categoryName;
  String? get categoryImage => _categoryImage;
  String? get categoryDesc => _categoryDesc;
  int? get categoryStatus => _categoryStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  // Setters
  set categoryId(int? value) {
    _categoryId = value;
  }

  set categoryName(String? value) {
    _categoryName = value;
  }

  set categoryImage(String? value) {
    _categoryImage = value;
  }

  set categoryDesc(String? value) {
    _categoryDesc = value;
  }

  set categoryStatus(int? value) {
    _categoryStatus = value;
  }

  set createdAt(String? value) {
    _createdAt = value;
  }

  set updatedAt(String? value) {
    _updatedAt = value;
  }
}
