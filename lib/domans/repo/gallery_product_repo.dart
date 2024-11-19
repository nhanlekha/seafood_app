import '../../model/gallery_product_model.dart';

abstract class GalleryProductRepo {
  Future<List<GalleryProductModel>> listGalleryByProductId(int productId);
}