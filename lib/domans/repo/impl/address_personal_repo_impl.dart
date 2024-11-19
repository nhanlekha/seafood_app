import 'package:drift/drift.dart';
import 'package:seafood_app/model/address_personal_model.dart';

import '../../database_local/app_database.dart';
import '../address_personal_repo.dart';

class AddressPersonalRepoImpl extends AddressPersonalRepo {

  final AppDatabase _db = AppDatabase();


  @override
  Future<int> addAddressPersonal({required customerId, required nameDress, required shippingName, required shippingEmail, required shippingPhone, required cityName, required provinceName, required wardName, required homeNumber, required isChecked}) {

    final entry = AddressPersonalModelCompanion(
      customerId: Value(customerId),
      nameDress: Value(nameDress),
      shippingName: Value(shippingName),
      shippingEmail: Value(shippingEmail),
      shippingPhone: Value(shippingPhone),
      cityName: Value(cityName),
      provinceName: Value(provinceName),
      wardName: Value(wardName),
      homeNumber: Value(homeNumber),
      isChecked: Value(isChecked),
    );

    if (isChecked) {
      // TODO: update isChecked = false for all addressPersonal of this customer and change AddressDefault to this address

      _db.resetAddressPersonalIsChecked(customerId);
      _db.setAddressDefaultForCustomer(customerId);
    }

    return _db.insertAddressPersonal(entry);
  }

  @override
  Future<AddressPersonal> fetchAddressPersonalById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<AddressPersonal>> fetchListAddressPersonal(int customerId) async {
    return _db.fetchListAddressPersonal(customerId);
  }

  @override
  Future<int> removeAddressPersonal(int id) {

    return _db.removeAddressPersonal(id);
  }

  @override
  Future<int> removeDefaultAddressPersonal() {
    // TODO: implement removeDefaultAddressPersonal
    throw UnimplementedError();
  }

  @override
  Future<int> setDefaultAddressPersonal(int id) {
    // TODO: implement setDefaultAddressPersonal
    throw UnimplementedError();
  }

  @override
  Future<int> updateAddressPersonal({required dressPersonalId, required customerId, required nameDress, required shippingName, required shippingEmail, required shippingPhone, required cityName, required provinceName, required wardName, required homeNumber, required isChecked}) {
    // TODO: implement updateAddressPersonal
    throw UnimplementedError();
  }

}
