import 'package:drift/drift.dart';

@DataClassName('AddressPersonal')
class AddressPersonalModel extends Table {
  IntColumn get dressPersonalId => integer().autoIncrement()();
  IntColumn get customerId => integer()();
  BoolColumn get isChecked => boolean().withDefault(const Constant(false))();
  TextColumn get nameDress => text().withLength(min: 1, max: 255)();
  TextColumn get shippingName => text().withLength(min: 1, max: 255)();
  TextColumn get shippingEmail => text().withLength(min: 1, max: 255)();
  TextColumn get shippingPhone => text().withLength(min: 10, max: 20)();
  TextColumn get cityName => text().withLength(min: 1, max: 100)();
  TextColumn get provinceName => text().withLength(min: 1, max: 100)();
  TextColumn get wardName => text().withLength(min: 1, max: 100)();
  TextColumn get homeNumber => text().withLength(min: 1, max: 100)();
}
