class ShippingModel {
  int? shippingId;
  String? shippingName;
  String? shippingEmail;
  int? shippingPhone;
  String? shippingAddress;
  String? shippingNotes;
  int? shippingSpecialRequirements;
  int? shippingReceipt;
  String? createdAt;
  String? updatedAt;

  ShippingModel();

  ShippingModel.withDetails(this.shippingId, this.shippingName, this.shippingEmail, this.shippingPhone, this.shippingAddress, this.shippingNotes, this.shippingSpecialRequirements, this.shippingReceipt, this.createdAt, this.updatedAt);

  ShippingModel.withoutId(this.shippingName, this.shippingEmail, this.shippingPhone, this.shippingAddress, this.shippingNotes, this.shippingSpecialRequirements, this.shippingReceipt);

  // Constructor từ JSON
  ShippingModel.fromJson(Map<String, dynamic> json) {
    shippingId = json['shipping_id'];
    shippingName = json['shipping_name'];
    shippingEmail = json['shipping_email'];
    shippingPhone = json['shipping_phone'];
    shippingAddress = json['shipping_address'];
    shippingNotes = json['shipping_notes'];
    shippingSpecialRequirements = json['shipping_special_requirements'];
    shippingReceipt = json['shipping_receipt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shipping_id'] = shippingId;
    data['shipping_name'] = shippingName;
    data['shipping_email'] = shippingEmail;
    data['shipping_phone'] = shippingPhone;
    data['shipping_address'] = shippingAddress;
    data['shipping_notes'] = shippingNotes;
    data['shipping_special_requirements'] = shippingSpecialRequirements;
    data['shipping_receipt'] = shippingReceipt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
