part of 'category_cubit.dart';

class CategoryState extends Equatable {
  DataStatus dataStatus;
  DataModel dataModel;

  CategoryState({required this.dataStatus, required this.dataModel});

  List<Object> get props => [
    dataStatus,dataModel
  ];
}
