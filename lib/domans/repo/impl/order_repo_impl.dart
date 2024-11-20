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

      // Kiểm tra nếu response.data và response.data['data'] không phải null
      if (response.data != null && response.data['data'] != null) {
        // Lấy danh sách 'data' từ response
        List<dynamic> data = response.data['data'];

        // Kiểm tra nếu 'data' không rỗng
        if (data.isNotEmpty) {
          // Chuyển đổi danh sách JSON thành danh sách các đối tượng OrderModel
          return data.map((json) => OrderModel.fromJson(json)).toList();
        } else {
          // Trường hợp danh sách 'data' rỗng
          print('Dữ liệu trả về là danh sách rỗng');
          return [];
        }
      } else {
        // Trường hợp response.data hoặc response.data['data'] là null
        print('Dữ liệu trả về null hoặc không hợp lệ');
        return [];
      }

    });
  }
}
