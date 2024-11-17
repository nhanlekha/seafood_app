import 'package:drift/drift.dart';
import '../../database_local/app_database.dart';
import 'package:seafood_app/model/favourite_model.dart';
import 'package:seafood_app/domans/repo/impl/favourite_repo.dart';

class FavouriteRepoImpl extends FavouriteRepo {
  final AppDatabase _db = AppDatabase();

  @override
  Future<int> addFavourite({required customerId, required productId}) {
    final entry = FavouriteModelCompanion(
      customerId: Value(customerId),
      productId: Value(productId),
    );
    return _db.insertFavourite(entry);
  }

  // @override
  // Future<AddressPersonal> fetchAddressPersonalById(int id) {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List<AddressPersonal>> fetchListAddressPersonal(int customerId) async {
  //   return _db.fetchListAddressPersonal(customerId);
  // }

  @override
  Future<int> removeFavourite(int id) {
    return _db.removeFavourite(id);
  }
}
