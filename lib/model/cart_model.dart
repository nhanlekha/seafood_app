import 'package:drift/drift.dart';

@DataClassName('Cart')
class CartModel extends Table {
  IntColumn get cartId => integer().autoIncrement()(); // Auto-increment for cartId
  IntColumn get productId => integer()();
  IntColumn get customerId => integer()();
  TextColumn get productName => text()();
  RealColumn get productPrice => real()();
  TextColumn get productImage => text()();
  IntColumn get productQuantity => integer()();
  BoolColumn get checkedProduct => boolean().withDefault(const Constant(false))(); // Default unchecked
}
