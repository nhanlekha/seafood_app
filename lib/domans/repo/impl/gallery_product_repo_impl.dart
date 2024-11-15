import 'package:seafood_app/domans/data_source/seafood_api.dart';

import '../../../model/gallery_product_model.dart';
import '../gallery_product_repo.dart';

class GalleryProductRepoImpl implements GalleryProductRepo {

  final SeafoodApi seafoodApi = SeafoodApi();

  GalleryProductRepoImpl();

  @override
  Future<List<GalleryProductModel>> listGalleryByProductId(int productId) async {
    return seafoodApi.sendRequest.post('android/get-gallery-product', data: {'product_id': productId}).then((response) {
      List<dynamic> data = response.data['data'];
      return data.map((json) => GalleryProductModel.fromJson(json)).toList();
    });
  }
}