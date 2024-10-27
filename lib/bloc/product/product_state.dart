import 'package:equatable/equatable.dart';
import '../../model/data_model.dart';
import '../../ultils/enums/enum_data.dart';

class ProductState extends Equatable {
  final DataStatus dataStatus;
  final DataModel? dataTrendingProductModel;
  final DataModel? dataNewProductModel;

  const ProductState({
    required this.dataStatus,
    this.dataTrendingProductModel,
    this.dataNewProductModel,
  });


  ProductState copyWith({
    required final DataStatus dataStatus,
    final DataModel? dataTrendingProductModel,
    final DataModel? dataNewProductModel,
  }) {
    return ProductState(
      dataStatus: dataStatus ?? this.dataStatus,
      dataTrendingProductModel:
          dataTrendingProductModel ?? this.dataTrendingProductModel,
      dataNewProductModel: dataNewProductModel ?? this.dataNewProductModel,
    );
  }

  @override
  List<Object?> get props => [
    dataStatus,
    dataTrendingProductModel,
    dataNewProductModel,
  ];
}


