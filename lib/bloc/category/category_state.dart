import 'package:equatable/equatable.dart';
import '../../model/data_model.dart';
import '../../ultils/enums/enum_data.dart';

class CategoryState extends Equatable {
  DataStatus dataStatus;
  DataModel dataModel;

  CategoryState({required this.dataStatus, required this.dataModel});

  CategoryState copyWith({
    required final DataStatus dataStatus,
    final DataModel? dataModel,
  }) {
    return CategoryState(
      dataStatus: dataStatus ?? this.dataStatus,
      dataModel: dataModel ?? this.dataModel,
    );
  }

  List<Object> get props => [
    dataStatus,dataModel
  ];
}
