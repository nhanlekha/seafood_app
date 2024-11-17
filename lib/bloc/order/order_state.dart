import 'package:equatable/equatable.dart';
import '../../model/data_model.dart';
import '../../ultils/enums/enum_data.dart';

class OrderState extends Equatable {
  DataStatus dataStatus;
  DataModel dataModel;
  DataModel? dataStatus_1;
  DataModel? dataStatus_2;
  DataModel? dataStatus_3;
  DataModel? dataStatus_4;

  OrderState({required this.dataStatus, required this.dataModel, this.dataStatus_1, this.dataStatus_2, this.dataStatus_3, this.dataStatus_4});

  OrderState copyWith({
    required final DataStatus dataStatus,
    final DataModel? dataModel,
    final DataModel? dataStatus_1,
    final DataModel? dataStatus_2,
    final DataModel? dataStatus_3,
    final DataModel? dataStatus_4,
  }) {
    return OrderState(
      dataStatus: dataStatus ?? this.dataStatus,
      dataModel: dataModel ?? this.dataModel,
      dataStatus_1: dataStatus_1 ?? this.dataStatus_1,
      dataStatus_2: dataStatus_2 ?? this.dataStatus_2,
      dataStatus_3: dataStatus_3 ?? this.dataStatus_3,
      dataStatus_4: dataStatus_4 ?? this.dataStatus_4,
    );
  }

  List<Object?> get props => [
    dataStatus,dataModel, dataStatus_1, dataStatus_2, dataStatus_3, dataStatus_4
  ];
}
