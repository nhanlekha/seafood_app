import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_app/bloc/slide/slide_state.dart';
import 'package:seafood_app/domans/repo/impl/slide_repo_impl.dart';
import 'package:seafood_app/model/data_model.dart';
import 'package:seafood_app/model/slider_model.dart';

import '../../domans/repo/slide_repo.dart';
import '../../ultils/enums/enum_data.dart';

class SlideCubit extends Cubit<SlideState> {

  SlideRepo slideRepo;

  SlideCubit(this.slideRepo) : super(SlideState(dataStatus: DataStatus.initial, dataModel:DataModel(message: "initial", code: 404, data: null) ));

  void fetchData() async{
    try{
      List<SliderModel> data = await slideRepo.fetchData();
      emit(SlideState(dataStatus: DataStatus.success, dataModel:DataModel(message: "success", code: 200, data: data)));
    } on DioException catch(ex){
      emit(SlideState(dataStatus: DataStatus.error,dataModel: DataModel(message: "error", code: 404, data: null)));
    }
  }

}
