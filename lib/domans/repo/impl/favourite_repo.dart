import 'package:seafood_app/model/favourite_model.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';

abstract class FavouriteRepo {
  // Future<List<Favourite>> fetchListFavourite(int customerId);

  // Future<Favourite> fetchFavouriteById(int id);

  Future<int> addFavourite({
    required customerId,
    required productId,
  });

  Future<int> removeFavourite(int id);
}
