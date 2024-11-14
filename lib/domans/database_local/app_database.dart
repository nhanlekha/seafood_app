// app_database.dart
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../model/cart_model.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CartModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

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

  Future<int> updateProductChecked(int cartId, bool status) {
    return (update(cartModel)..where((tbl) => tbl.cartId.equals(cartId)))
        .write(CartModelCompanion(checkedProduct: Value(status)));
  }

  // Get all carts where checkedProduct is true
  Future<List<Cart>> getCheckedCarts() {
    return (select(cartModel)..where((tbl) => tbl.checkedProduct.equals(true))).get();
  }

  // Calculate total price for all products based on productQuantity and productPrice
  Future<double> calculateTotalPrice() async {
    final carts = await getCheckedCarts();
    double total = 0.0;
    for (var cart in carts) {
      total += cart.productQuantity * cart.productPrice;
    }
    return total;
  }

  // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
  Future<bool> isProductInCart(int productId) async {
    final query = select(cartModel)..where((tbl) => tbl.productId.equals(productId));
    final result = await query.get();
    return result.isNotEmpty;
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

}
