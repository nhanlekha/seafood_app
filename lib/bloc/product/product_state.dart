import '../../model/data_model.dart';
import 'package:equatable/equatable.dart';
import '../../ultils/enums/enum_data.dart';

class ProductState extends Equatable {
  final DataStatus dataStatus;
  final DataModel? dataTrendingProductModel;
  final DataModel? dataNewProductModel;
  final DataModel? dataProductsByCategory;

  const ProductState(
      {required this.dataStatus,
      this.dataTrendingProductModel,
      this.dataNewProductModel,
      this.dataProductsByCategory});

  ProductState copyWith(
      {required final DataStatus dataStatus,
      final DataModel? dataTrendingProductModel,
      final DataModel? dataNewProductModel,
      final DataModel? dataProductsByCategory}) {
    return ProductState(
        dataStatus: dataStatus ?? this.dataStatus,
        dataTrendingProductModel:
            dataTrendingProductModel ?? this.dataTrendingProductModel,
        dataNewProductModel: dataNewProductModel ?? this.dataNewProductModel,
        dataProductsByCategory:
            dataProductsByCategory ?? this.dataProductsByCategory);
  }

  @override
  List<Object?> get props => [
        dataStatus,
        dataTrendingProductModel,
        dataNewProductModel,
        dataProductsByCategory
      ];
}
