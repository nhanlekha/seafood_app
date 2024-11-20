import 'dart:convert';

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

  // Phương thức từ CustomerModel sang JSON String
  String convertToJson() {
    final Map<String, dynamic> jsonData = {
      'customer_id': customerId,
      'customer_name': customerName,
      'customer_phone': customerPhone,
      'customer_email': customerEmail,
      'customer_password': customerPassword,
    };
    return jsonEncode(jsonData); // Chuyển thành chuỗi JSON
  }



  // Hàm tĩnh: parse JSON string thành CustomerModel
  static CustomerModel? parseCustomerFromJson(String? jsonString) {
    if (jsonString == null || jsonString.isEmpty) {
      print('JSON đầu vào rỗng hoặc null.');
      return null;
    }
    try {
      final Map<String, dynamic> jsonData = jsonDecode(jsonString); // Giải mã JSON
      return CustomerModel.fromJson(jsonData); // Tạo đối tượng CustomerModel
    } catch (e) {
      print('Lỗi khi parse JSON: $e');
      return null; // Xử lý lỗi và trả về null nếu JSON không hợp lệ
    }
  }
}
