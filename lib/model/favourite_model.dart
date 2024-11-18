import 'package:drift/drift.dart';

@DataClassName('Favourite')
class FavouriteModel extends Table {
  // ID sản phẩm
  IntColumn get productId => integer().autoIncrement()();

  // Tên khách hàng hoặc ID khách hàng
  IntColumn get customerId => integer().nullable()();

  // Tên sản phẩm
  TextColumn get productName => text().withLength(min: 1, max: 255)();

  // Món ngon chế biến từ sản phẩm
  TextColumn get productDeliciousFoods => text().nullable()();

  // Đơn vị của sản phẩm
  TextColumn get productUnit => text().nullable()();

  // Số lượng sản phẩm
  IntColumn get productQuantity => integer().nullable()();

  // Cách giao hàng của sản phẩm
  TextColumn get productDeliveryWay => text().nullable()();

  // Tên danh mục của sản phẩm
  TextColumn get categoryName => text().nullable()();

  // Xuất xứ của sản phẩm
  TextColumn get productOrigin => text().nullable()();

  // Ảnh sản phẩm
  TextColumn get productImage => text().nullable()();

  // Giá sản phẩm
  RealColumn get productPrice => real()();
}
