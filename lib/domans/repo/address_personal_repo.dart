import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:seafood_app/domans/database_local/app_database.dart';
import 'package:seafood_app/model/address_personal_model.dart';

abstract class AddressPersonalRepo {
  Future<List<AddressPersonal>> fetchListAddressPersonal(int customerId);

  Future<AddressPersonal> fetchAddressPersonalById(int id);

  /*
@DataClassName('AddressPersonal')
class AddressPersonalModel extends Table {
  IntColumn get dressPersonalId => integer().autoIncrement()();
  IntColumn get customerId => integer()();
  BoolColumn get isChecked => boolean().withDefault(const Constant(false))();
  TextColumn get nameDress => text().withLength(min: 1, max: 255)();
  TextColumn get shippingName => text().withLength(min: 1, max: 255)();
  TextColumn get shippingEmail => text().withLength(min: 1, max: 255)();
  IntColumn get shippingPhone => integer()();
  TextColumn get cityName => text().withLength(min: 1, max: 100)();
  TextColumn get provinceName => text().withLength(min: 1, max: 100)();
  TextColumn get wardName => text().withLength(min: 1, max: 100)();
  TextColumn get homeNumber => text().withLength(min: 1, max: 100)();
}

  * */
  Future<int> addAddressPersonal({
    required customerId,
    required nameDress,
    required shippingName,
    required shippingEmail,
    required shippingPhone,
    required cityName,
    required provinceName,
    required wardName,
    required homeNumber,
    required isChecked,
  });

  Future<int> updateAddressPersonal({
    required dressPersonalId,
    required customerId,
    required nameDress,
    required shippingName,
    required shippingEmail,
    required shippingPhone,
    required cityName,
    required provinceName,
    required wardName,
    required homeNumber,
    required isChecked,
  });

  Future<int> removeAddressPersonal(int id);

  Future<int> setDefaultAddressPersonal(int id);

  Future<int> removeDefaultAddressPersonal();
}
