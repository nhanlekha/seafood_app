import 'package:seafood_app/model/favourite_model.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';

abstract class FavouriteRepo {
  // Lấy danh sách sản phẩm yêu thích của một khách hàng
  Future<List<Favourite>> fetchListFavourite(int customerId);

  // // // Lấy chi tiết sản phẩm yêu thích theo ID

  // Thêm sản phẩm vào danh sách yêu thích
  Future<int> addFavourite({
    required int customerId,
    required int productId,
    required String productName,
    required String productDeliciousFoods,
    required String productUnit,
    required int productQuantity,
    required String productDeliveryWay,
    required String categoryName,
    required String productOrigin,
    required String productImage,
    required double productPrice,
  });

  // Xóa sản phẩm khỏi danh sách yêu thích
  Future<int> removeFavourite(int productId);
}
