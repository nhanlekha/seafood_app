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

class $AddressPersonalModelTable extends AddressPersonalModel
    with TableInfo<$AddressPersonalModelTable, AddressPersonal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressPersonalModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dressPersonalIdMeta =
      const VerificationMeta('dressPersonalId');
  @override
  late final GeneratedColumn<int> dressPersonalId = GeneratedColumn<int>(
      'dress_personal_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCheckedMeta =
      const VerificationMeta('isChecked');
  @override
  late final GeneratedColumn<bool> isChecked = GeneratedColumn<bool>(
      'is_checked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_checked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nameDressMeta =
      const VerificationMeta('nameDress');
  @override
  late final GeneratedColumn<String> nameDress = GeneratedColumn<String>(
      'name_dress', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _shippingNameMeta =
      const VerificationMeta('shippingName');
  @override
  late final GeneratedColumn<String> shippingName = GeneratedColumn<String>(
      'shipping_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _shippingEmailMeta =
      const VerificationMeta('shippingEmail');
  @override
  late final GeneratedColumn<String> shippingEmail = GeneratedColumn<String>(
      'shipping_email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _shippingPhoneMeta =
      const VerificationMeta('shippingPhone');
  @override
  late final GeneratedColumn<String> shippingPhone = GeneratedColumn<String>(
      'shipping_phone', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cityNameMeta =
      const VerificationMeta('cityName');
  @override
  late final GeneratedColumn<String> cityName = GeneratedColumn<String>(
      'city_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _provinceNameMeta =
      const VerificationMeta('provinceName');
  @override
  late final GeneratedColumn<String> provinceName = GeneratedColumn<String>(
      'province_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _wardNameMeta =
      const VerificationMeta('wardName');
  @override
  late final GeneratedColumn<String> wardName = GeneratedColumn<String>(
      'ward_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _homeNumberMeta =
      const VerificationMeta('homeNumber');
  @override
  late final GeneratedColumn<String> homeNumber = GeneratedColumn<String>(
      'home_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        dressPersonalId,
        customerId,
        isChecked,
        nameDress,
        shippingName,
        shippingEmail,
        shippingPhone,
        cityName,
        provinceName,
        wardName,
        homeNumber
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'address_personal_model';
  @override
  VerificationContext validateIntegrity(Insertable<AddressPersonal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dress_personal_id')) {
      context.handle(
          _dressPersonalIdMeta,
          dressPersonalId.isAcceptableOrUnknown(
              data['dress_personal_id']!, _dressPersonalIdMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('name_dress')) {
      context.handle(_nameDressMeta,
          nameDress.isAcceptableOrUnknown(data['name_dress']!, _nameDressMeta));
    } else if (isInserting) {
      context.missing(_nameDressMeta);
    }
    if (data.containsKey('shipping_name')) {
      context.handle(
          _shippingNameMeta,
          shippingName.isAcceptableOrUnknown(
              data['shipping_name']!, _shippingNameMeta));
    } else if (isInserting) {
      context.missing(_shippingNameMeta);
    }
    if (data.containsKey('shipping_email')) {
      context.handle(
          _shippingEmailMeta,
          shippingEmail.isAcceptableOrUnknown(
              data['shipping_email']!, _shippingEmailMeta));
    } else if (isInserting) {
      context.missing(_shippingEmailMeta);
    }
    if (data.containsKey('shipping_phone')) {
      context.handle(
          _shippingPhoneMeta,
          shippingPhone.isAcceptableOrUnknown(
              data['shipping_phone']!, _shippingPhoneMeta));
    } else if (isInserting) {
      context.missing(_shippingPhoneMeta);
    }
    if (data.containsKey('city_name')) {
      context.handle(_cityNameMeta,
          cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta));
    } else if (isInserting) {
      context.missing(_cityNameMeta);
    }
    if (data.containsKey('province_name')) {
      context.handle(
          _provinceNameMeta,
          provinceName.isAcceptableOrUnknown(
              data['province_name']!, _provinceNameMeta));
    } else if (isInserting) {
      context.missing(_provinceNameMeta);
    }
    if (data.containsKey('ward_name')) {
      context.handle(_wardNameMeta,
          wardName.isAcceptableOrUnknown(data['ward_name']!, _wardNameMeta));
    } else if (isInserting) {
      context.missing(_wardNameMeta);
    }
    if (data.containsKey('home_number')) {
      context.handle(
          _homeNumberMeta,
          homeNumber.isAcceptableOrUnknown(
              data['home_number']!, _homeNumberMeta));
    } else if (isInserting) {
      context.missing(_homeNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dressPersonalId};
  @override
  AddressPersonal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AddressPersonal(
      dressPersonalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dress_personal_id'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      nameDress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_dress'])!,
      shippingName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipping_name'])!,
      shippingEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipping_email'])!,
      shippingPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shipping_phone'])!,
      cityName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city_name'])!,
      provinceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}province_name'])!,
      wardName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ward_name'])!,
      homeNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}home_number'])!,
    );
  }

  @override
  $AddressPersonalModelTable createAlias(String alias) {
    return $AddressPersonalModelTable(attachedDatabase, alias);
  }
}

class AddressPersonal extends DataClass implements Insertable<AddressPersonal> {
  final int dressPersonalId;
  final int customerId;
  final bool isChecked;
  final String nameDress;
  final String shippingName;
  final String shippingEmail;
  final String shippingPhone;
  final String cityName;
  final String provinceName;
  final String wardName;
  final String homeNumber;
  const AddressPersonal(
      {required this.dressPersonalId,
      required this.customerId,
      required this.isChecked,
      required this.nameDress,
      required this.shippingName,
      required this.shippingEmail,
      required this.shippingPhone,
      required this.cityName,
      required this.provinceName,
      required this.wardName,
      required this.homeNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dress_personal_id'] = Variable<int>(dressPersonalId);
    map['customer_id'] = Variable<int>(customerId);
    map['is_checked'] = Variable<bool>(isChecked);
    map['name_dress'] = Variable<String>(nameDress);
    map['shipping_name'] = Variable<String>(shippingName);
    map['shipping_email'] = Variable<String>(shippingEmail);
    map['shipping_phone'] = Variable<String>(shippingPhone);
    map['city_name'] = Variable<String>(cityName);
    map['province_name'] = Variable<String>(provinceName);
    map['ward_name'] = Variable<String>(wardName);
    map['home_number'] = Variable<String>(homeNumber);
    return map;
  }

  AddressPersonalModelCompanion toCompanion(bool nullToAbsent) {
    return AddressPersonalModelCompanion(
      dressPersonalId: Value(dressPersonalId),
      customerId: Value(customerId),
      isChecked: Value(isChecked),
      nameDress: Value(nameDress),
      shippingName: Value(shippingName),
      shippingEmail: Value(shippingEmail),
      shippingPhone: Value(shippingPhone),
      cityName: Value(cityName),
      provinceName: Value(provinceName),
      wardName: Value(wardName),
      homeNumber: Value(homeNumber),
    );
  }

  factory AddressPersonal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AddressPersonal(
      dressPersonalId: serializer.fromJson<int>(json['dressPersonalId']),
      customerId: serializer.fromJson<int>(json['customerId']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      nameDress: serializer.fromJson<String>(json['nameDress']),
      shippingName: serializer.fromJson<String>(json['shippingName']),
      shippingEmail: serializer.fromJson<String>(json['shippingEmail']),
      shippingPhone: serializer.fromJson<String>(json['shippingPhone']),
      cityName: serializer.fromJson<String>(json['cityName']),
      provinceName: serializer.fromJson<String>(json['provinceName']),
      wardName: serializer.fromJson<String>(json['wardName']),
      homeNumber: serializer.fromJson<String>(json['homeNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dressPersonalId': serializer.toJson<int>(dressPersonalId),
      'customerId': serializer.toJson<int>(customerId),
      'isChecked': serializer.toJson<bool>(isChecked),
      'nameDress': serializer.toJson<String>(nameDress),
      'shippingName': serializer.toJson<String>(shippingName),
      'shippingEmail': serializer.toJson<String>(shippingEmail),
      'shippingPhone': serializer.toJson<String>(shippingPhone),
      'cityName': serializer.toJson<String>(cityName),
      'provinceName': serializer.toJson<String>(provinceName),
      'wardName': serializer.toJson<String>(wardName),
      'homeNumber': serializer.toJson<String>(homeNumber),
    };
  }

  AddressPersonal copyWith(
          {int? dressPersonalId,
          int? customerId,
          bool? isChecked,
          String? nameDress,
          String? shippingName,
          String? shippingEmail,
          String? shippingPhone,
          String? cityName,
          String? provinceName,
          String? wardName,
          String? homeNumber}) =>
      AddressPersonal(
        dressPersonalId: dressPersonalId ?? this.dressPersonalId,
        customerId: customerId ?? this.customerId,
        isChecked: isChecked ?? this.isChecked,
        nameDress: nameDress ?? this.nameDress,
        shippingName: shippingName ?? this.shippingName,
        shippingEmail: shippingEmail ?? this.shippingEmail,
        shippingPhone: shippingPhone ?? this.shippingPhone,
        cityName: cityName ?? this.cityName,
        provinceName: provinceName ?? this.provinceName,
        wardName: wardName ?? this.wardName,
        homeNumber: homeNumber ?? this.homeNumber,
      );
  AddressPersonal copyWithCompanion(AddressPersonalModelCompanion data) {
    return AddressPersonal(
      dressPersonalId: data.dressPersonalId.present
          ? data.dressPersonalId.value
          : this.dressPersonalId,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      nameDress: data.nameDress.present ? data.nameDress.value : this.nameDress,
      shippingName: data.shippingName.present
          ? data.shippingName.value
          : this.shippingName,
      shippingEmail: data.shippingEmail.present
          ? data.shippingEmail.value
          : this.shippingEmail,
      shippingPhone: data.shippingPhone.present
          ? data.shippingPhone.value
          : this.shippingPhone,
      cityName: data.cityName.present ? data.cityName.value : this.cityName,
      provinceName: data.provinceName.present
          ? data.provinceName.value
          : this.provinceName,
      wardName: data.wardName.present ? data.wardName.value : this.wardName,
      homeNumber:
          data.homeNumber.present ? data.homeNumber.value : this.homeNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AddressPersonal(')
          ..write('dressPersonalId: $dressPersonalId, ')
          ..write('customerId: $customerId, ')
          ..write('isChecked: $isChecked, ')
          ..write('nameDress: $nameDress, ')
          ..write('shippingName: $shippingName, ')
          ..write('shippingEmail: $shippingEmail, ')
          ..write('shippingPhone: $shippingPhone, ')
          ..write('cityName: $cityName, ')
          ..write('provinceName: $provinceName, ')
          ..write('wardName: $wardName, ')
          ..write('homeNumber: $homeNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      dressPersonalId,
      customerId,
      isChecked,
      nameDress,
      shippingName,
      shippingEmail,
      shippingPhone,
      cityName,
      provinceName,
      wardName,
      homeNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressPersonal &&
          other.dressPersonalId == this.dressPersonalId &&
          other.customerId == this.customerId &&
          other.isChecked == this.isChecked &&
          other.nameDress == this.nameDress &&
          other.shippingName == this.shippingName &&
          other.shippingEmail == this.shippingEmail &&
          other.shippingPhone == this.shippingPhone &&
          other.cityName == this.cityName &&
          other.provinceName == this.provinceName &&
          other.wardName == this.wardName &&
          other.homeNumber == this.homeNumber);
}

class AddressPersonalModelCompanion extends UpdateCompanion<AddressPersonal> {
  final Value<int> dressPersonalId;
  final Value<int> customerId;
  final Value<bool> isChecked;
  final Value<String> nameDress;
  final Value<String> shippingName;
  final Value<String> shippingEmail;
  final Value<String> shippingPhone;
  final Value<String> cityName;
  final Value<String> provinceName;
  final Value<String> wardName;
  final Value<String> homeNumber;
  const AddressPersonalModelCompanion({
    this.dressPersonalId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.nameDress = const Value.absent(),
    this.shippingName = const Value.absent(),
    this.shippingEmail = const Value.absent(),
    this.shippingPhone = const Value.absent(),
    this.cityName = const Value.absent(),
    this.provinceName = const Value.absent(),
    this.wardName = const Value.absent(),
    this.homeNumber = const Value.absent(),
  });
  AddressPersonalModelCompanion.insert({
    this.dressPersonalId = const Value.absent(),
    required int customerId,
    this.isChecked = const Value.absent(),
    required String nameDress,
    required String shippingName,
    required String shippingEmail,
    required String shippingPhone,
    required String cityName,
    required String provinceName,
    required String wardName,
    required String homeNumber,
  })  : customerId = Value(customerId),
        nameDress = Value(nameDress),
        shippingName = Value(shippingName),
        shippingEmail = Value(shippingEmail),
        shippingPhone = Value(shippingPhone),
        cityName = Value(cityName),
        provinceName = Value(provinceName),
        wardName = Value(wardName),
        homeNumber = Value(homeNumber);
  static Insertable<AddressPersonal> custom({
    Expression<int>? dressPersonalId,
    Expression<int>? customerId,
    Expression<bool>? isChecked,
    Expression<String>? nameDress,
    Expression<String>? shippingName,
    Expression<String>? shippingEmail,
    Expression<String>? shippingPhone,
    Expression<String>? cityName,
    Expression<String>? provinceName,
    Expression<String>? wardName,
    Expression<String>? homeNumber,
  }) {
    return RawValuesInsertable({
      if (dressPersonalId != null) 'dress_personal_id': dressPersonalId,
      if (customerId != null) 'customer_id': customerId,
      if (isChecked != null) 'is_checked': isChecked,
      if (nameDress != null) 'name_dress': nameDress,
      if (shippingName != null) 'shipping_name': shippingName,
      if (shippingEmail != null) 'shipping_email': shippingEmail,
      if (shippingPhone != null) 'shipping_phone': shippingPhone,
      if (cityName != null) 'city_name': cityName,
      if (provinceName != null) 'province_name': provinceName,
      if (wardName != null) 'ward_name': wardName,
      if (homeNumber != null) 'home_number': homeNumber,
    });
  }

  AddressPersonalModelCompanion copyWith(
      {Value<int>? dressPersonalId,
      Value<int>? customerId,
      Value<bool>? isChecked,
      Value<String>? nameDress,
      Value<String>? shippingName,
      Value<String>? shippingEmail,
      Value<String>? shippingPhone,
      Value<String>? cityName,
      Value<String>? provinceName,
      Value<String>? wardName,
      Value<String>? homeNumber}) {
    return AddressPersonalModelCompanion(
      dressPersonalId: dressPersonalId ?? this.dressPersonalId,
      customerId: customerId ?? this.customerId,
      isChecked: isChecked ?? this.isChecked,
      nameDress: nameDress ?? this.nameDress,
      shippingName: shippingName ?? this.shippingName,
      shippingEmail: shippingEmail ?? this.shippingEmail,
      shippingPhone: shippingPhone ?? this.shippingPhone,
      cityName: cityName ?? this.cityName,
      provinceName: provinceName ?? this.provinceName,
      wardName: wardName ?? this.wardName,
      homeNumber: homeNumber ?? this.homeNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dressPersonalId.present) {
      map['dress_personal_id'] = Variable<int>(dressPersonalId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (nameDress.present) {
      map['name_dress'] = Variable<String>(nameDress.value);
    }
    if (shippingName.present) {
      map['shipping_name'] = Variable<String>(shippingName.value);
    }
    if (shippingEmail.present) {
      map['shipping_email'] = Variable<String>(shippingEmail.value);
    }
    if (shippingPhone.present) {
      map['shipping_phone'] = Variable<String>(shippingPhone.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String>(cityName.value);
    }
    if (provinceName.present) {
      map['province_name'] = Variable<String>(provinceName.value);
    }
    if (wardName.present) {
      map['ward_name'] = Variable<String>(wardName.value);
    }
    if (homeNumber.present) {
      map['home_number'] = Variable<String>(homeNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressPersonalModelCompanion(')
          ..write('dressPersonalId: $dressPersonalId, ')
          ..write('customerId: $customerId, ')
          ..write('isChecked: $isChecked, ')
          ..write('nameDress: $nameDress, ')
          ..write('shippingName: $shippingName, ')
          ..write('shippingEmail: $shippingEmail, ')
          ..write('shippingPhone: $shippingPhone, ')
          ..write('cityName: $cityName, ')
          ..write('provinceName: $provinceName, ')
          ..write('wardName: $wardName, ')
          ..write('homeNumber: $homeNumber')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CartModelTable cartModel = $CartModelTable(this);
  late final $AddressPersonalModelTable addressPersonalModel =
      $AddressPersonalModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cartModel, addressPersonalModel];
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
typedef $$AddressPersonalModelTableCreateCompanionBuilder
    = AddressPersonalModelCompanion Function({
  Value<int> dressPersonalId,
  required int customerId,
  Value<bool> isChecked,
  required String nameDress,
  required String shippingName,
  required String shippingEmail,
  required String shippingPhone,
  required String cityName,
  required String provinceName,
  required String wardName,
  required String homeNumber,
});
typedef $$AddressPersonalModelTableUpdateCompanionBuilder
    = AddressPersonalModelCompanion Function({
  Value<int> dressPersonalId,
  Value<int> customerId,
  Value<bool> isChecked,
  Value<String> nameDress,
  Value<String> shippingName,
  Value<String> shippingEmail,
  Value<String> shippingPhone,
  Value<String> cityName,
  Value<String> provinceName,
  Value<String> wardName,
  Value<String> homeNumber,
});

class $$AddressPersonalModelTableFilterComposer
    extends Composer<_$AppDatabase, $AddressPersonalModelTable> {
  $$AddressPersonalModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get dressPersonalId => $composableBuilder(
      column: $table.dressPersonalId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameDress => $composableBuilder(
      column: $table.nameDress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingName => $composableBuilder(
      column: $table.shippingName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingEmail => $composableBuilder(
      column: $table.shippingEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shippingPhone => $composableBuilder(
      column: $table.shippingPhone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cityName => $composableBuilder(
      column: $table.cityName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get provinceName => $composableBuilder(
      column: $table.provinceName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wardName => $composableBuilder(
      column: $table.wardName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get homeNumber => $composableBuilder(
      column: $table.homeNumber, builder: (column) => ColumnFilters(column));
}

class $$AddressPersonalModelTableOrderingComposer
    extends Composer<_$AppDatabase, $AddressPersonalModelTable> {
  $$AddressPersonalModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get dressPersonalId => $composableBuilder(
      column: $table.dressPersonalId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameDress => $composableBuilder(
      column: $table.nameDress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingName => $composableBuilder(
      column: $table.shippingName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingEmail => $composableBuilder(
      column: $table.shippingEmail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shippingPhone => $composableBuilder(
      column: $table.shippingPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cityName => $composableBuilder(
      column: $table.cityName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get provinceName => $composableBuilder(
      column: $table.provinceName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wardName => $composableBuilder(
      column: $table.wardName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get homeNumber => $composableBuilder(
      column: $table.homeNumber, builder: (column) => ColumnOrderings(column));
}

class $$AddressPersonalModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $AddressPersonalModelTable> {
  $$AddressPersonalModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get dressPersonalId => $composableBuilder(
      column: $table.dressPersonalId, builder: (column) => column);

  GeneratedColumn<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<String> get nameDress =>
      $composableBuilder(column: $table.nameDress, builder: (column) => column);

  GeneratedColumn<String> get shippingName => $composableBuilder(
      column: $table.shippingName, builder: (column) => column);

  GeneratedColumn<String> get shippingEmail => $composableBuilder(
      column: $table.shippingEmail, builder: (column) => column);

  GeneratedColumn<String> get shippingPhone => $composableBuilder(
      column: $table.shippingPhone, builder: (column) => column);

  GeneratedColumn<String> get cityName =>
      $composableBuilder(column: $table.cityName, builder: (column) => column);

  GeneratedColumn<String> get provinceName => $composableBuilder(
      column: $table.provinceName, builder: (column) => column);

  GeneratedColumn<String> get wardName =>
      $composableBuilder(column: $table.wardName, builder: (column) => column);

  GeneratedColumn<String> get homeNumber => $composableBuilder(
      column: $table.homeNumber, builder: (column) => column);
}

class $$AddressPersonalModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AddressPersonalModelTable,
    AddressPersonal,
    $$AddressPersonalModelTableFilterComposer,
    $$AddressPersonalModelTableOrderingComposer,
    $$AddressPersonalModelTableAnnotationComposer,
    $$AddressPersonalModelTableCreateCompanionBuilder,
    $$AddressPersonalModelTableUpdateCompanionBuilder,
    (
      AddressPersonal,
      BaseReferences<_$AppDatabase, $AddressPersonalModelTable, AddressPersonal>
    ),
    AddressPersonal,
    PrefetchHooks Function()> {
  $$AddressPersonalModelTableTableManager(
      _$AppDatabase db, $AddressPersonalModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AddressPersonalModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AddressPersonalModelTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AddressPersonalModelTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> dressPersonalId = const Value.absent(),
            Value<int> customerId = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String> nameDress = const Value.absent(),
            Value<String> shippingName = const Value.absent(),
            Value<String> shippingEmail = const Value.absent(),
            Value<String> shippingPhone = const Value.absent(),
            Value<String> cityName = const Value.absent(),
            Value<String> provinceName = const Value.absent(),
            Value<String> wardName = const Value.absent(),
            Value<String> homeNumber = const Value.absent(),
          }) =>
              AddressPersonalModelCompanion(
            dressPersonalId: dressPersonalId,
            customerId: customerId,
            isChecked: isChecked,
            nameDress: nameDress,
            shippingName: shippingName,
            shippingEmail: shippingEmail,
            shippingPhone: shippingPhone,
            cityName: cityName,
            provinceName: provinceName,
            wardName: wardName,
            homeNumber: homeNumber,
          ),
          createCompanionCallback: ({
            Value<int> dressPersonalId = const Value.absent(),
            required int customerId,
            Value<bool> isChecked = const Value.absent(),
            required String nameDress,
            required String shippingName,
            required String shippingEmail,
            required String shippingPhone,
            required String cityName,
            required String provinceName,
            required String wardName,
            required String homeNumber,
          }) =>
              AddressPersonalModelCompanion.insert(
            dressPersonalId: dressPersonalId,
            customerId: customerId,
            isChecked: isChecked,
            nameDress: nameDress,
            shippingName: shippingName,
            shippingEmail: shippingEmail,
            shippingPhone: shippingPhone,
            cityName: cityName,
            provinceName: provinceName,
            wardName: wardName,
            homeNumber: homeNumber,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AddressPersonalModelTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $AddressPersonalModelTable,
        AddressPersonal,
        $$AddressPersonalModelTableFilterComposer,
        $$AddressPersonalModelTableOrderingComposer,
        $$AddressPersonalModelTableAnnotationComposer,
        $$AddressPersonalModelTableCreateCompanionBuilder,
        $$AddressPersonalModelTableUpdateCompanionBuilder,
        (
          AddressPersonal,
          BaseReferences<_$AppDatabase, $AddressPersonalModelTable,
              AddressPersonal>
        ),
        AddressPersonal,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CartModelTableTableManager get cartModel =>
      $$CartModelTableTableManager(_db, _db.cartModel);
  $$AddressPersonalModelTableTableManager get addressPersonalModel =>
      $$AddressPersonalModelTableTableManager(_db, _db.addressPersonalModel);
}
