import '../../model/slider_model.dart';

abstract class SlideRepo {
  Future<List<SliderModel>> fetchData();
}