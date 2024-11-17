import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_app/bloc/order/order_state.dart';
import 'package:seafood_app/domans/repo/cate_repo.dart';
import 'package:seafood_app/domans/repo/order_repo.dart';
import 'package:seafood_app/model/category_model.dart';
import 'package:seafood_app/model/order_model.dart';

import '../../model/data_model.dart';
import '../../ultils/enums/enum_data.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderRepo orderRepo;

  OrderCubit(this.orderRepo)
      : super(OrderState(
            dataStatus: DataStatus.initial,
            dataModel: DataModel(message: "initial", code: 404, data: null)));

  void fetchStatus1(int customerId) async{
    try {
      final List<OrderModel> data = await orderRepo.fetchData(customerId, 1);
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataStatus_1: DataModel(message: "success", code: 200, data: data)));

    } on DioError catch (e) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataStatus_1: DataModel(message: e.message, code: 500, data: null)));
    }

  }
  void fetchStatus2(int customerId) async{
    try {
      final List<OrderModel> data = await orderRepo.fetchData(customerId, 2);
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataStatus_2: DataModel(message: "success", code: 200, data: data)));

    } on DioError catch (e) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataStatus_2: DataModel(message: e.message, code: 500, data: null)));
    }

  }
  void fetchStatus3(int customerId) async{
    try {
      final List<OrderModel> data = await orderRepo.fetchData(customerId, 3);
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataStatus_3: DataModel(message: "success", code: 200, data: data)));

    } on DioError catch (e) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataStatus_3: DataModel(message: e.message, code: 500, data: null)));
    }

  }
  void fetchStatus4(int customerId) async{
    try {
      final List<OrderModel> data = await orderRepo.fetchData(customerId, 4);
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataStatus_4: DataModel(message: "success", code: 200, data: data)));

    } on DioError catch (e) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataStatus_4: DataModel(message: e.message, code: 500, data: null)));
    }

  }


  void fetchData(int customerId, int status) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    try {
      final List<OrderModel> data = await orderRepo.fetchData(customerId, status);
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataModel: DataModel(message: "success", code: 200, data: data)));
    } on DioError catch (e) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataModel: DataModel(message: e.message, code: 500, data: null)));
    }
  }
}
