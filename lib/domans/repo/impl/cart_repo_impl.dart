// cart_repository.dart
import 'package:drift/drift.dart';

import '../../database_local/app_database.dart';

class CartRepoImpl {
  final AppDatabase _db;

  CartRepoImpl(this._db);

  Future<int> addCart({
    required int productId,
    required int customerId,
    required String productName,
    required double productPrice,
    required String productImage,
    required int productQuantity,
    bool checkedProduct = false,
  }) async {
    final entry = CartModelCompanion(
      productId: Value(productId),
      customerId: Value(customerId),
      productName: Value(productName),
      productPrice: Value(productPrice),
      productImage: Value(productImage),
      productQuantity: Value(productQuantity),
      checkedProduct: Value(checkedProduct),
    );
    return _db.insertCart(entry);
  }

  Future<int> removeCart(int cartId) async {
    return _db.deleteCart(cartId);
  }

  Future<List<Cart>> fetchAllCarts() async {
    return _db.getAllCarts();
  }

  Future<List<Cart>> getCheckedCarts() async {
    return _db.getCheckedCarts();
  }


  Future<bool> isProductInCart(int productId) async {
    return _db.isProductInCart(productId);
  }

  Future<int> updateProductQuantity(int cartId, int newQuantity) {
    return _db.updateProductQuantity(cartId,newQuantity);
  }

  Future<double> calculateTotalPrice() async {
    return _db.calculateTotalPrice();
  }

  Future<int> updateProductChecked(int cartId, bool status) {
    return _db.updateProductChecked(cartId,status);
  }

}
