import 'package:drift/drift.dart';
import '../../database_local/app_database.dart';
import 'package:seafood_app/model/favourite_model.dart';
import 'package:seafood_app/domans/repo/favourite_repo.dart';
import 'package:seafood_app/domans/repo/favourite_repo.dart';

class FavouriteRepoImpl extends FavouriteRepo {
  final AppDatabase _db = AppDatabase();

  @override
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
  }) {
    final entry = FavouriteModelCompanion(
      customerId: Value(customerId),
      productId: Value(productId),
      productName: Value(productName),
      productDeliciousFoods: Value(productDeliciousFoods),
      productUnit: Value(productUnit),
      productQuantity: Value(productQuantity),
      productDeliveryWay: Value(productDeliveryWay),
      categoryName: Value(categoryName),
      productOrigin: Value(productOrigin),
      productImage: Value(productImage),
      productPrice: Value(productPrice),
    );
    return _db.insertFavourite(entry);
  }

  @override
  Future<List<Favourite>> fetchListFavourite(int customerId) async {
    return _db.fetchListFavourite(customerId);
  }

  @override
  Future<int> removeFavourite(int productId) {
    return _db.removeFavourite(productId);
  }
}
