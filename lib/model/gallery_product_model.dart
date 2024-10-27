class GalleryProductModel {
  int? galleryProductId;
  int? productId;
  String? galleryProductName;
  String? galleryProductImage;
  String? galleryProductContent;

  GalleryProductModel({
    this.galleryProductId,
    this.productId,
    this.galleryProductName,
    this.galleryProductImage,
    this.galleryProductContent,
  });

  // Constructor từ JSON
  GalleryProductModel.fromJson(Map<String, dynamic> json) {
    galleryProductId = json['gallery_product_id'];
    productId = json['product_id'];
    galleryProductName = json['gallery_product_name'];
    galleryProductImage = json['gallery_product_image'];
    galleryProductContent = json['gallery_product_content'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gallery_product_id'] = galleryProductId;
    data['product_id'] = productId;
    data['gallery_product_name'] = galleryProductName;
    data['gallery_product_image'] = galleryProductImage;
    data['gallery_product_content'] = galleryProductContent;
    return data;
  }
}
