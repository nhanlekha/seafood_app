class CityModel {
  int? matp;
  String? nameCity;
  String? type;

  CityModel({this.matp, this.nameCity, this.type});

  // Constructor từ JSON
  CityModel.fromJson(Map<String, dynamic> json) {
    matp = json['matp'];
    nameCity = json['name_city'];
    type = json['type'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['matp'] = matp;
    data['name_city'] = nameCity;
    data['type'] = type;
    return data;
  }
}
