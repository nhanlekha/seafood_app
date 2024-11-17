import 'package:drift/drift.dart';

@DataClassName('Favourite')
class FavouriteModel extends Table {
  IntColumn get productId => integer()();
  IntColumn get customerId => integer()();
}
