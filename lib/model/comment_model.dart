class CommentModel {
  int? commentId;
  String? orderCode;
  String? commentTitle;
  String? commentContent;
  int? commentCustomerId;
  String? commentCustomerName;
  int? commentProductId;
  int? commentRateStar;
  String? commentDate;

  CommentModel({
    this.commentId,
    this.orderCode,
    this.commentTitle,
    this.commentContent,
    this.commentCustomerId,
    this.commentCustomerName,
    this.commentProductId,
    this.commentRateStar,
    this.commentDate,
  });

  // Constructor từ JSON
  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    orderCode = json['order_code'];
    commentTitle = json['comment_title'];
    commentContent = json['comment_content'];
    commentCustomerId = json['comment_customer_id'];
    commentCustomerName = json['comment_customer_name'];
    commentProductId = json['comment_product_id'];
    commentRateStar = json['comment_rate_star'];
    commentDate = json['comment_date'];
  }

  // Phương thức chuyển đối tượng sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['comment_id'] = commentId;
    data['order_code'] = orderCode;
    data['comment_title'] = commentTitle;
    data['comment_content'] = commentContent;
    data['comment_customer_id'] = commentCustomerId;
    data['comment_customer_name'] = commentCustomerName;
    data['comment_product_id'] = commentProductId;
    data['comment_rate_star'] = commentRateStar;
    data['comment_date'] = commentDate;
    return data;
  }
}
