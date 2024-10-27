class SliderModel {
  int? sliderId;
  String? sliderName;
  String? sliderImage;
  String? sliderStatus;
  String? sliderDesc;
  String? createdAt;
  String? updatedAt;

  SliderModel();

  SliderModel.withDetails(this.sliderId, this.sliderName, this.sliderImage, this.sliderStatus, this.sliderDesc, this.createdAt, this.updatedAt);

  // Constructor từ JSON
  SliderModel.fromJson(Map<String, dynamic> json) {
    sliderId = json['slider_id'];
    sliderName = json['slider_name'];
    sliderImage = json['slider_image'];
    sliderStatus = json['slider_status'];
    sliderDesc = json['slider_desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slider_id'] = sliderId;
    data['slider_name'] = sliderName;
    data['slider_image'] = sliderImage;
    data['slider_status'] = sliderStatus;
    data['slider_desc'] = sliderDesc;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
