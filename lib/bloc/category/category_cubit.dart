
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_app/domans/repo/cate_repo.dart';
import 'package:seafood_app/model/category_model.dart';
import '../../model/data_model.dart';
import '../../ultils/enums/enum_data.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CateRepo cateRepo;

  CategoryCubit(this.cateRepo) : super(CategoryState(dataStatus: DataStatus.initial, dataModel:DataModel(message: "initial", code: 404, data: null)));

  void fetchData() async{
    try{
      List<CategoryModel> data = await cateRepo.fetchData();
      emit(CategoryState(dataStatus: DataStatus.success, dataModel:DataModel(message: "success", code: 200, data: data)));
    } on DioException catch(ex){
      emit(CategoryState(dataStatus: DataStatus.error,dataModel: DataModel(message: "error", code: 404, data: null)));
    }
  }
}

