class CustomerNewModel {
  String? customerEmail;
  int? code;
  int? status;

  CustomerNewModel({
    this.customerEmail,
    this.code,
    this.status,
  });

  // Constructor từ JSON
  CustomerNewModel.fromJson(Map<String, dynamic> json) {
    customerEmail = json['customer_email'];
    code = json['code'];
    status = json['status'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customer_email'] = customerEmail;
    data['code'] = code;
    data['status'] = status;
    return data;
  }
}
