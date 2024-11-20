import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/customer_model.dart';

Future<int?> getCustomerID() async {
  final prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('customer');
  if(json != null){
    CustomerModel? currentCustomer = CustomerModel.parseCustomerFromJson(json);
    return currentCustomer?.customerId;
  }
  return null;
}