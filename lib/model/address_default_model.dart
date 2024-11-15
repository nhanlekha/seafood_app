import 'package:drift/drift.dart';

@DataClassName('AddressDefault')
class AddressDefaultModel extends Table {
  IntColumn get addressId => integer()();
  IntColumn get customerId => integer()();
}
