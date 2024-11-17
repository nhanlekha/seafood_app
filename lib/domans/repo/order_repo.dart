import 'package:seafood_app/model/order_model.dart';

abstract class OrderRepo {
  Future<List<OrderModel>> fetchData(int customerId, int status);
}