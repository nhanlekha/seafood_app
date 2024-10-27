class CustomerModel {
  int? customerId;
  String? customerName;
  int? customerPhone;
  String? customerEmail;
  String? customerPassword;

  CustomerModel({
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.customerEmail,
    this.customerPassword,
  });

  // Constructor từ JSON
  CustomerModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerEmail = json['customer_email'];
    customerPassword = json['customer_password'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['customer_email'] = customerEmail;
    data['customer_password'] = customerPassword;
    return data;
  }
}
