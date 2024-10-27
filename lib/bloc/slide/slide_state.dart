import 'package:equatable/equatable.dart';
import 'package:seafood_app/model/data_model.dart';
import 'package:seafood_app/ultils/enums/enum_data.dart';

class SlideState extends Equatable {
  DataStatus dataStatus;
  DataModel dataModel;

  SlideState({required this.dataStatus, required this.dataModel});

  List<Object> get props => [
    dataStatus,dataModel
  ];
}
