// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CartModelTable extends CartModel with TableInfo<$CartModelTable, Cart> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cartIdMeta = const VerificationMeta('cartId');
  @override
  late final GeneratedColumn<int> cartId = GeneratedColumn<int>(
      'cart_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productPriceMeta =
      const VerificationMeta('productPrice');
  @override
  late final GeneratedColumn<double> productPrice = GeneratedColumn<double>(
      'product_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _productImageMeta =
      const VerificationMeta('productImage');
  @override
  late final GeneratedColumn<String> productImage = GeneratedColumn<String>(
      'product_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productQuantityMeta =
      const VerificationMeta('productQuantity');
  @override
  late final GeneratedColumn<int> productQuantity = GeneratedColumn<int>(
      'product_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _checkedProductMeta =
      const VerificationMeta('checkedProduct');
  @override
  late final GeneratedColumn<bool> checkedProduct = GeneratedColumn<bool>(
      'checked_product', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("checked_product" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        cartId,
        productId,
        customerId,
        productName,
        productPrice,
        productImage,
        productQuantity,
        checkedProduct
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_model';
  @override
  VerificationContext validateIntegrity(Insertable<Cart> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cart_id')) {
      context.handle(_cartIdMeta,
          cartId.isAcceptableOrUnknown(data['cart_id']!, _cartIdMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_price')) {
      context.handle(
          _productPriceMeta,
          productPrice.isAcceptableOrUnknown(
              data['product_price']!, _productPriceMeta));
    } else if (isInserting) {
      context.missing(_productPriceMeta);
    }
    if (data.containsKey('product_image')) {
      context.handle(
          _productImageMeta,
          productImage.isAcceptableOrUnknown(
              data['product_image']!, _productImageMeta));
    } else if (isInserting) {
      context.missing(_productImageMeta);
    }
    if (data.containsKey('product_quantity')) {
      context.handle(
          _productQuantityMeta,
          productQuantity.isAcceptableOrUnknown(
              data['product_quantity']!, _productQuantityMeta));
    } else if (isInserting) {
      context.missing(_productQuantityMeta);
    }
    if (data.containsKey('checked_product')) {
      context.handle(
          _checkedProductMeta,
          checkedProduct.isAcceptableOrUnknown(
              data['checked_product']!, _checkedProductMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cartId};
  @override
  Cart map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cart(
      cartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cart_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      productPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}product_price'])!,
      productImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_image'])!,
      productQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_quantity'])!,
      checkedProduct: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}checked_product'])!,
    );
  }

  @override
  $CartModelTable createAlias(String alias) {
    return $CartModelTable(attachedDatabase, alias);
  }
}

class Cart extends DataClass implements Insertable<Cart> {
  final int cartId;
  final int productId;
  final int customerId;
  final String productName;
  final double productPrice;
  final String productImage;
  final int productQuantity;
  final bool checkedProduct;
  const Cart(
      {required this.cartId,
      required this.productId,
      required this.customerId,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productQuantity,
      required this.checkedProduct});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cart_id'] = Variable<int>(cartId);
    map['product_id'] = Variable<int>(productId);
    map['customer_id'] = Variable<int>(customerId);
    map['product_name'] = Variable<String>(productName);
    map['product_price'] = Variable<double>(productPrice);
    map['product_image'] = Variable<String>(productImage);
    map['product_quantity'] = Variable<int>(productQuantity);
    map['checked_product'] = Variable<bool>(checkedProduct);
    return map;
  }

  CartModelCompanion toCompanion(bool nullToAbsent) {
    return CartModelCompanion(
      cartId: Value(cartId),
      productId: Value(productId),
      customerId: Value(customerId),
      productName: Value(productName),
      productPrice: Value(productPrice),
      productImage: Value(productImage),
      productQuantity: Value(productQuantity),
      checkedProduct: Value(checkedProduct),
    );
  }

  factory Cart.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cart(
      cartId: serializer.fromJson<int>(json['cartId']),
      productId: serializer.fromJson<int>(json['productId']),
      customerId: serializer.fromJson<int>(json['customerId']),
      productName: serializer.fromJson<String>(json['productName']),
      productPrice: serializer.fromJson<double>(json['productPrice']),
      productImage: serializer.fromJson<String>(json['productImage']),
      productQuantity: serializer.fromJson<int>(json['productQuantity']),
      checkedProduct: serializer.fromJson<bool>(json['checkedProduct']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cartId': serializer.toJson<int>(cartId),
      'productId': serializer.toJson<int>(productId),
      'customerId': serializer.toJson<int>(customerId),
      'productName': serializer.toJson<String>(productName),
      'productPrice': serializer.toJson<double>(productPrice),
      'productImage': serializer.toJson<String>(productImage),
      'productQuantity': serializer.toJson<int>(productQuantity),
      'checkedProduct': serializer.toJson<bool>(checkedProduct),
    };
  }

  Cart copyWith(
          {int? cartId,
          int? productId,
          int? customerId,
          String? productName,
          double? productPrice,
          String? productImage,
          int? productQuantity,
          bool? checkedProduct}) =>
      Cart(
        cartId: cartId ?? this.cartId,
        productId: productId ?? this.productId,
        customerId: customerId ?? this.customerId,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productImage: productImage ?? this.productImage,
        productQuantity: productQuantity ?? this.productQuantity,
        checkedProduct: checkedProduct ?? this.checkedProduct,
      );
  Cart copyWithCompanion(CartModelCompanion data) {
    return Cart(
      cartId: data.cartId.present ? data.cartId.value : this.cartId,
      productId: data.productId.present ? data.productId.value : this.productId,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      productPrice: data.productPrice.present
          ? data.productPrice.value
          : this.productPrice,
      productImage: data.productImage.present
          ? data.productImage.value
          : this.productImage,
      productQuantity: data.productQuantity.present
          ? data.productQuantity.value
          : this.productQuantity,
      checkedProduct: data.checkedProduct.present
          ? data.checkedProduct.value
          : this.checkedProduct,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cart(')
          ..write('cartId: $cartId, ')
          ..write('productId: $productId, ')
          ..write('customerId: $customerId, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('productImage: $productImage, ')
          ..write('productQuantity: $productQuantity, ')
          ..write('checkedProduct: $checkedProduct')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cartId, productId, customerId, productName,
      productPrice, productImage, productQuantity, checkedProduct);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cart &&
          other.cartId == this.cartId &&
          other.productId == this.productId &&
          other.customerId == this.customerId &&
          other.productName == this.productName &&
          other.productPrice == this.productPrice &&
          other.productImage == this.productImage &&
          other.productQuantity == this.productQuantity &&
          other.checkedProduct == this.checkedProduct);
}

class CartModelCompanion extends UpdateCompanion<Cart> {
  final Value<int> cartId;
  final Value<int> productId;
  final Value<int> customerId;
  final Value<String> productName;
  final Value<double> productPrice;
  final Value<String> productImage;
  final Value<int> productQuantity;
  final Value<bool> checkedProduct;
  const CartModelCompanion({
    this.cartId = const Value.absent(),
    this.productId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.productName = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.productImage = const Value.absent(),
    this.productQuantity = const Value.absent(),
    this.checkedProduct = const Value.absent(),
  });
  CartModelCompanion.insert({
    this.cartId = const Value.absent(),
    required int productId,
    required int customerId,
    required String productName,
    required double productPrice,
    required String productImage,
    required int productQuantity,
    this.checkedProduct = const Value.absent(),
  })  : productId = Value(productId),
        customerId = Value(customerId),
        productName = Value(productName),
        productPrice = Value(productPrice),
        productImage = Value(productImage),
        productQuantity = Value(productQuantity);
  static Insertable<Cart> custom({
    Expression<int>? cartId,
    Expression<int>? productId,
    Expression<int>? customerId,
    Expression<String>? productName,
    Expression<double>? productPrice,
    Expression<String>? productImage,
    Expression<int>? productQuantity,
    Expression<bool>? checkedProduct,
  }) {
    return RawValuesInsertable({
      if (cartId != null) 'cart_id': cartId,
      if (productId != null) 'product_id': productId,
      if (customerId != null) 'customer_id': customerId,
      if (productName != null) 'product_name': productName,
      if (productPrice != null) 'product_price': productPrice,
      if (productImage != null) 'product_image': productImage,
      if (productQuantity != null) 'product_quantity': productQuantity,
      if (checkedProduct != null) 'checked_product': checkedProduct,
    });
  }

  CartModelCompanion copyWith(
      {Value<int>? cartId,
      Value<int>? productId,
      Value<int>? customerId,
      Value<String>? productName,
      Value<double>? productPrice,
      Value<String>? productImage,
      Value<int>? productQuantity,
      Value<bool>? checkedProduct}) {
    return CartModelCompanion(
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      customerId: customerId ?? this.customerId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productImage: productImage ?? this.productImage,
      productQuantity: productQuantity ?? this.productQuantity,
      checkedProduct: checkedProduct ?? this.checkedProduct,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cartId.present) {
      map['cart_id'] = Variable<int>(cartId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productPrice.present) {
      map['product_price'] = Variable<double>(productPrice.value);
    }
    if (productImage.present) {
      map['product_image'] = Variable<String>(productImage.value);
    }
    if (productQuantity.present) {
      map['product_quantity'] = Variable<int>(productQuantity.value);
    }
    if (checkedProduct.present) {
      map['checked_product'] = Variable<bool>(checkedProduct.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartModelCompanion(')
          ..write('cartId: $cartId, ')
          ..write('productId: $productId, ')
          ..write('customerId: $customerId, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('productImage: $productImage, ')
          ..write('productQuantity: $productQuantity, ')
          ..write('checkedProduct: $checkedProduct')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CartModelTable cartModel = $CartModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cartModel];
}

typedef $$CartModelTableCreateCompanionBuilder = CartModelCompanion Function({
  Value<int> cartId,
  required int productId,
  required int customerId,
  required String productName,
  required double productPrice,
  required String productImage,
  required int productQuantity,
  Value<bool> checkedProduct,
});
typedef $$CartModelTableUpdateCompanionBuilder = CartModelCompanion Function({
  Value<int> cartId,
  Value<int> productId,
  Value<int> customerId,
  Value<String> productName,
  Value<double> productPrice,
  Value<String> productImage,
  Value<int> productQuantity,
  Value<bool> checkedProduct,
});

class $$CartModelTableFilterComposer
    extends Composer<_$AppDatabase, $CartModelTable> {
  $$CartModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cartId => $composableBuilder(
      column: $table.cartId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get productPrice => $composableBuilder(
      column: $table.productPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productImage => $composableBuilder(
      column: $table.productImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productQuantity => $composableBuilder(
      column: $table.productQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get checkedProduct => $composableBuilder(
      column: $table.checkedProduct,
      builder: (column) => ColumnFilters(column));
}

class $$CartModelTableOrderingComposer
    extends Composer<_$AppDatabase, $CartModelTable> {
  $$CartModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cartId => $composableBuilder(
      column: $table.cartId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get productPrice => $composableBuilder(
      column: $table.productPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productImage => $composableBuilder(
      column: $table.productImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productQuantity => $composableBuilder(
      column: $table.productQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get checkedProduct => $composableBuilder(
      column: $table.checkedProduct,
      builder: (column) => ColumnOrderings(column));
}

class $$CartModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartModelTable> {
  $$CartModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cartId =>
      $composableBuilder(column: $table.cartId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<double> get productPrice => $composableBuilder(
      column: $table.productPrice, builder: (column) => column);

  GeneratedColumn<String> get productImage => $composableBuilder(
      column: $table.productImage, builder: (column) => column);

  GeneratedColumn<int> get productQuantity => $composableBuilder(
      column: $table.productQuantity, builder: (column) => column);

  GeneratedColumn<bool> get checkedProduct => $composableBuilder(
      column: $table.checkedProduct, builder: (column) => column);
}

class $$CartModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CartModelTable,
    Cart,
    $$CartModelTableFilterComposer,
    $$CartModelTableOrderingComposer,
    $$CartModelTableAnnotationComposer,
    $$CartModelTableCreateCompanionBuilder,
    $$CartModelTableUpdateCompanionBuilder,
    (Cart, BaseReferences<_$AppDatabase, $CartModelTable, Cart>),
    Cart,
    PrefetchHooks Function()> {
  $$CartModelTableTableManager(_$AppDatabase db, $CartModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> cartId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int> customerId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<double> productPrice = const Value.absent(),
            Value<String> productImage = const Value.absent(),
            Value<int> productQuantity = const Value.absent(),
            Value<bool> checkedProduct = const Value.absent(),
          }) =>
              CartModelCompanion(
            cartId: cartId,
            productId: productId,
            customerId: customerId,
            productName: productName,
            productPrice: productPrice,
            productImage: productImage,
            productQuantity: productQuantity,
            checkedProduct: checkedProduct,
          ),
          createCompanionCallback: ({
            Value<int> cartId = const Value.absent(),
            required int productId,
            required int customerId,
            required String productName,
            required double productPrice,
            required String productImage,
            required int productQuantity,
            Value<bool> checkedProduct = const Value.absent(),
          }) =>
              CartModelCompanion.insert(
            cartId: cartId,
            productId: productId,
            customerId: customerId,
            productName: productName,
            productPrice: productPrice,
            productImage: productImage,
            productQuantity: productQuantity,
            checkedProduct: checkedProduct,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CartModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CartModelTable,
    Cart,
    $$CartModelTableFilterComposer,
    $$CartModelTableOrderingComposer,
    $$CartModelTableAnnotationComposer,
    $$CartModelTableCreateCompanionBuilder,
    $$CartModelTableUpdateCompanionBuilder,
    (Cart, BaseReferences<_$AppDatabase, $CartModelTable, Cart>),
    Cart,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CartModelTableTableManager get cartModel =>
      $$CartModelTableTableManager(_db, _db.cartModel);
}
