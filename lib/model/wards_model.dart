class WardModel {
  int? xaid;
  String? nameWard;
  String? type;
  int? maqh;

  WardModel();

  WardModel.withDetails(this.xaid, this.nameWard, this.type, this.maqh);

  // Constructor từ JSON
  WardModel.fromJson(Map<String, dynamic> json) {
    xaid = json['xaid'];
    nameWard = json['name_ward'];
    type = json['type'];
    maqh = json['maqh'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['xaid'] = xaid;
    data['name_ward'] = nameWard;
    data['type'] = type;
    data['maqh'] = maqh;
    return data;
  }
}
