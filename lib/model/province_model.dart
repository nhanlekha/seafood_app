class ProvinceModel {
  int? maqh;
  String? nameProvince;
  String? type;
  int? matp;

  ProvinceModel();

  ProvinceModel.withDetails(this.maqh, this.nameProvince, this.type, this.matp);

  // Constructor từ JSON
  ProvinceModel.fromJson(Map<String, dynamic> json) {
    maqh = json['maqh'];
    nameProvince = json['name_province'];
    type = json['type'];
    matp = json['matp'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maqh'] = maqh;
    data['name_province'] = nameProvince;
    data['type'] = type;
    data['matp'] = matp;
    return data;
  }
}
