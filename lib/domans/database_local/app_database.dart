// app_database.dart
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../model/address_personal_model.dart';
import '../../model/cart_model.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CartModel, AddressPersonalModel])
class AppDatabase extends _$AppDatabase {

  // Private constructor for singleton
  AppDatabase._internal() : super(_openConnection());

  // Single instance of AppDatabase
  static final AppDatabase _instance = AppDatabase._internal();

  // Public factory constructor for accessing the singleton instance
  factory AppDatabase() => _instance;

  @override
  int get schemaVersion => 1;

  Future<int> insertCart(CartModelCompanion entry) => into(cartModel).insert(entry);
  Future<int> deleteCart(int cartId) => (delete(cartModel)..where((tbl) => tbl.cartId.equals(cartId))).go();
  Future<List<Cart>> getAllCarts() => select(cartModel).get();

  // Update the product quantity
  Future<int> updateProductQuantity(int cartId, int newQuantity) {
    return (update(cartModel)..where((tbl) => tbl.cartId.equals(cartId)))
        .write(CartModelCompanion(productQuantity: Value(newQuantity)));
  }

  // Get all carts where checkedProduct is true
  Future<List<Cart>> getCheckedCarts() {
    return (select(cartModel)..where((tbl) => tbl.checkedProduct.equals(true))).get();
  }

  // Calculate total price for all products based on productQuantity and productPrice
  Future<double> calculateTotalPrice() async {
    final carts = await getAllCarts();
    double total = 0.0;
    for (var cart in carts) {
      total += cart.productQuantity * cart.productPrice;
    }
    return total;
  }

  // Check if a product is already in the cart
  Future<bool> isProductInCart(int productId) async {
    final query = select(cartModel)..where((tbl) => tbl.productId.equals(productId));
    final result = await query.get();
    return result.isNotEmpty;
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  Future<int> insertAddressPersonal(AddressPersonalModelCompanion entry) {
    return into(addressPersonalModel).insert(entry);
  }

  Future<List<AddressPersonal>> fetchListAddressPersonal(int customerId) {
    return (select(addressPersonalModel)
      ..where((tbl) => tbl.customerId.equals(customerId))).get();
  }

  Future<int> resetAddressPersonalIsChecked(int customerId) {
    return (update(addressPersonalModel)..where((tbl) => tbl.customerId.equals(customerId)))
        .write(AddressPersonalModelCompanion(isChecked: Value(false)));
  }

  void setAddressDefaultForCustomer(int customerId) {
    return;
  }

  Future<int> removeAddressPersonal(int id) async {
    return await (delete(addressPersonalModel)..where((tbl) => tbl.dressPersonalId.equals(id))).go();
  }
}
