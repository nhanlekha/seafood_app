class DressPersonal {
  int _dressPersonalId;
  int _customerId;
  bool _isChecked;
  String _nameDress;
  String _shippingName;
  String _shippingEmail;
  int _shippingPhone;
  String _cityName;
  String _provinceName;
  String _wardName;
  String _homeNumber;

  // Constructor
  DressPersonal({
    int dressPersonalId = 0,
    required int customerId,
    required bool isChecked,
    required String nameDress,
    required String shippingName,
    required String shippingEmail,
    required int shippingPhone,
    required String cityName,
    required String provinceName,
    required String wardName,
    required String homeNumber,
  })  : _dressPersonalId = dressPersonalId,
        _customerId = customerId,
        _isChecked = isChecked,
        _nameDress = nameDress,
        _shippingName = shippingName,
        _shippingEmail = shippingEmail,
        _shippingPhone = shippingPhone,
        _cityName = cityName,
        _provinceName = provinceName,
        _wardName = wardName,
        _homeNumber = homeNumber;

  // Getter and Setter methods

  int get dressPersonalId => _dressPersonalId;
  set dressPersonalId(int value) {
    _dressPersonalId = value;
  }

  int get customerId => _customerId;
  set customerId(int value) {
    _customerId = value;
  }

  bool get isChecked => _isChecked;
  set isChecked(bool value) {
    _isChecked = value;
  }

  String get nameDress => _nameDress;
  set nameDress(String value) {
    _nameDress = value;
  }

  String get shippingName => _shippingName;
  set shippingName(String value) {
    _shippingName = value;
  }

  String get shippingEmail => _shippingEmail;
  set shippingEmail(String value) {
    _shippingEmail = value;
  }

  int get shippingPhone => _shippingPhone;
  set shippingPhone(int value) {
    _shippingPhone = value;
  }

  String get cityName => _cityName;
  set cityName(String value) {
    _cityName = value;
  }

  String get provinceName => _provinceName;
  set provinceName(String value) {
    _provinceName = value;
  }

  String get wardName => _wardName;
  set wardName(String value) {
    _wardName = value;
  }

  String get homeNumber => _homeNumber;
  set homeNumber(String value) {
    _homeNumber = value;
  }

  // Factory constructor to create a DressPersonal from a JSON object
  factory DressPersonal.fromJson(Map<String, dynamic> json) {
    return DressPersonal(
      dressPersonalId: json['dress_personal_id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      isChecked: json['isChecked'] ?? false,
      nameDress: json['name_dress'] ?? '',
      shippingName: json['shipping_name'] ?? '',
      shippingEmail: json['shipping_email'] ?? '',
      shippingPhone: json['shipping_phone'] ?? 0,
      cityName: json['city_name'] ?? '',
      provinceName: json['province_name'] ?? '',
      wardName: json['ward_name'] ?? '',
      homeNumber: json['home_number'] ?? '',
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'dress_personal_id': _dressPersonalId,
      'customer_id': _customerId,
      'isChecked': _isChecked,
      'name_dress': _nameDress,
      'shipping_name': _shippingName,
      'shipping_email': _shippingEmail,
      'shipping_phone': _shippingPhone,
      'city_name': _cityName,
      'province_name': _provinceName,
      'ward_name': _wardName,
      'home_number': _homeNumber,
    };
  }

  // Equality check (overriding == operator)
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DressPersonal) return false;
    return other._dressPersonalId == _dressPersonalId &&
        other._customerId == _customerId;
  }

  @override
  int get hashCode => _dressPersonalId.hashCode ^ _customerId.hashCode;
}
