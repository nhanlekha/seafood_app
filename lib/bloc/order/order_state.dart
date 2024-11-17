import 'package:equatable/equatable.dart';
import '../../model/data_model.dart';
import '../../ultils/enums/enum_data.dart';

class OrderState extends Equatable {
  DataStatus dataStatus;
  DataModel dataModel;

  OrderState({required this.dataStatus, required this.dataModel});

  OrderState copyWith({
    required final DataStatus dataStatus,
    final DataModel? dataModel,
  }) {
    return OrderState(
      dataStatus: dataStatus ?? this.dataStatus,
      dataModel: dataModel ?? this.dataModel,
    );
  }

  List<Object> get props => [
    dataStatus,dataModel
  ];
}
