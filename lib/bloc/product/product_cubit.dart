import 'package:dio/dio.dart';
import '../../model/data_model.dart';
import '../../ultils/enums/enum_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_app/model/product_model.dart';
import 'package:seafood_app/domans/repo/product_repo.dart';
import 'package:seafood_app/bloc/product/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepo productRepo;

  ProductCubit(this.productRepo)
      : super(const ProductState(dataStatus: DataStatus.initial));

  void fetchNewProductData() async {
    try {
      List<ProductModel> data = await productRepo.fetchNewProductData();
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataNewProductModel:
              DataModel(message: "success", code: 200, data: data)));
    } on DioException catch (ex) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataNewProductModel:
              DataModel(message: "error", code: 404, data: null)));
    }
  }

  void fetchTrendingProductData() async {
    try {
      List<ProductModel> data = await productRepo.fetchTrendingProductData();
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataTrendingProductModel:
              DataModel(message: "success", code: 200, data: data)));
    } on DioException catch (ex) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataTrendingProductModel:
              DataModel(message: "error", code: 404, data: null)));
    }
  }

  // void fetchProductData() async {
  //   try {
  //     List<ProductModel> data = await productRepo.fetchProductData();
  //     emit(state.copyWith(
  //         dataStatus: DataStatus.success,
  //         dataTrendingProductModel:
  //         DataModel(message: "success", code: 200, data: data)));
  //   } on DioException catch (ex) {
  //     emit(state.copyWith(
  //         dataStatus: DataStatus.error,
  //         dataTrendingProductModel:
  //         DataModel(message: "error", code: 404, data: null)));
  //   }
  // }

  void fetchHotSaleProductData() async {
    try {
      List<ProductModel> data = await productRepo.fetchHotSaleProductData();
      emit(state.copyWith(
          dataStatus: DataStatus.success,
          dataHotSaleModel:
          DataModel(message: "success", code: 200, data: data)));
    } on DioException catch (ex) {
      emit(state.copyWith(
          dataStatus: DataStatus.error,
          dataHotSaleModel:
          DataModel(message: "error", code: 404, data: null)));
    }
  }

  void fetchProductDataByCategoryId(List<int> categoryIds) async {
    try {
      List<ProductModel> allProducts = [];

      for (var id in categoryIds) {
        List<ProductModel> data =
            await productRepo.fetchProductDataByCategoryId(id);
        allProducts.addAll(data);
      }

      emit(state.copyWith(
        dataStatus: DataStatus.success,
        dataProductsByCategory: DataModel(
          message: "success",
          code: 200,
          data: allProducts,
        ),
      ));
    } on DioException catch (ex) {
      emit(state.copyWith(
        dataStatus: DataStatus.error,
        dataProductsByCategory: DataModel(
          message: "error",
          code: 404,
          data: null,
        ),
      ));
    }
  }
}
