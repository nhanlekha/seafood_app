class PaymentModel {
  int? paymentId;
  int? paymentMethod;
  int? paymentStatus;

  PaymentModel();

  PaymentModel.withDetails(this.paymentId, this.paymentMethod, this.paymentStatus);

  // Constructor từ JSON
  PaymentModel.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_id'] = paymentId;
    data['payment_method'] = paymentMethod;
    data['payment_status'] = paymentStatus;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'payment_id': paymentId,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
    };
  }
}
