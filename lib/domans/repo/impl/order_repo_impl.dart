import 'package:seafood_app/domans/data_source/seafood_api.dart';
import 'package:seafood_app/domans/repo/impl/base_repo_impl.dart';
import 'package:seafood_app/domans/repo/order_repo.dart';

import '../../../model/order_model.dart';

class OrderRepoImpl extends BaseRepoImpl implements OrderRepo {
  SeafoodApi seafoodApi;

  OrderRepoImpl({required this.seafoodApi}) : super(seafoodApi: seafoodApi);

  @override
  Future<List<OrderModel>> fetchData(int customerId, int status) {
    // TODO: implement fetchData
    return seafoodApi.sendRequest.get('android/get-order', data: {'customer_id': customerId, 'order_status': status}).then((response) {

      List<dynamic> data = response.data['data'];

      return data.map((json) => OrderModel.fromJson(json)).toList();
    });
  }
}
