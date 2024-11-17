import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:seafood_app/domans/repo/gallery_product_repo.dart';
import 'package:seafood_app/domans/repo/impl/gallery_product_repo_impl.dart';
import 'package:seafood_app/routers/app_route_config.dart';
import 'package:seafood_app/screens/widgets/review_card.dart';
import '../../../domans/database_local/app_database.dart';
import '../../../domans/repo/impl/cart_repo_impl.dart';
import '../../../model/product_model.dart';
import '../../widgets/toast_widget.dart';
import '../../widgets/vip_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;

  ProductDetailsScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late List<String>? imageUrls = [];
  late List<Widget>? imageSliders = [];

  double? rating = 5.0;


  final GalleryProductRepo galleryProductRepo = GalleryProductRepoImpl();

  @override
  void initState() {
    super.initState();
    _fetchGalleryProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Carousel Slider
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              height: 300.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1,
            ),
          ),
          // AppBar dạng tràn
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  IconButton(
                    icon: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.4),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Chat Button
                  Row(
                    children: [
                      IconButton(
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.4),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        onPressed: () {
                          
                          context.push('/cart');
                        },
                      ),
                      IconButton(
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.4),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Nội dung bên dưới
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.6,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffe8584b), Colors.orange],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flash_on,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'FLASH SALE',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'KẾT THÚC TRONG:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '00:00:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Color(0xfffffffb),
                            Color(0xfffffefd),
                            Color(0xffFFF5F1),
                          ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'vi_VN',
                                          customPattern: '₫###,###,###,###',
                                          symbol: '₫',
                                          decimalDigits: 0,
                                        ).format(double.tryParse(
                                                '${widget.productModel.productPrice}') ??
                                            0),
                                        style: const TextStyle(
                                          fontSize: 24,
                                          color: Colors.deepOrangeAccent,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        '₫1.999.999',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.local_shipping,
                                        color: Colors.green,
                                        size: 18,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Miễn phí vận chuyển',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${widget.productModel.productUnitSold}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.shopping_bag,
                                          color: Colors.yellow[700],
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'Đã bán',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                         Text(
                                          '$rating',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow[700],
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'Đánh giá',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    'Yêu Thích',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${widget.productModel.productName}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding:
                                      const EdgeInsets.all(3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.favorite,
                                          size: 25,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${widget.productModel.productDeliciousFoods}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Thông tin sản phẩm',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Trọng lượng: ${widget.productModel.productUnit} kg',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Số lượng còn lại: ${widget.productModel.productQuantity}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Cách vận chuyển: ${widget.productModel.productDeliveryWay}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Loại sản phẩm: ${widget.productModel.categoryName}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Xuất xứ: ${widget.productModel.productOrigin}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Hình ảnh sản phẩm',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imageUrls?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            imageUrls![index],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Đánh giá sản phẩm',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(child: _buildReviewCard())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            VipButton(
              onPressed: () => _showBottomNavigationBar(context),
              icon: Icons.add_shopping_cart_rounded,
              textColor: Colors.white,
              backgroundColor: Colors.green,
              text: 'Giỏ hàng',
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: VipButton(
                onPressed: () {},
                text: 'Mua ngay',
                icon: Icons.shopping_bag_rounded,
                textColor: Colors.white,
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchGalleryProduct() async {
    await galleryProductRepo
        .listGalleryByProductId(widget.productModel.productId!)
        .then((value) {
      setState(() {
        imageUrls =
            value.map((e) => e.galleryProductImage).cast<String>().toList();
      });

      imageSliders = imageUrls
          ?.map(
            (item) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList();
    });
  }

  void _showBottomNavigationBar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent(productModel: widget.productModel);
      },
    );
  }




  Widget _buildReviewCard() {
    List<Widget> listReview = widget.productModel.commentList!.map((e) {
      return ReviewCard(
        name: e.commentCustomerName!,
        review: e.commentContent!,
        rating: e.commentRateStar!,
        date: e.commentDate!,
      );
    }).toList();

    if (listReview.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text('Chưa có đánh giá nào'),
        ),
      );
    } else {
      rating = listReview
          .map((e) => (e as ReviewCard).rating)
          .reduce((value, element) => value + element) /
          listReview.length;
    }

    return Column(
      children: [...listReview],
    );
  }
}


class BottomSheetContent extends StatefulWidget {
  final ProductModel productModel; // Truyền dữ liệu sản phẩm vào đây

  const BottomSheetContent({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title and Cancel Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Thêm Vào Giỏ Hàng",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          // Product Info Section
          Row(
            children: [
              // Product Image
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400]!,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    '${widget.productModel.productImage}',
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Product Name, Price, and Quantity
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.productModel.productName}",
                    style: const TextStyle(fontSize: 17, color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'vi_VN',
                      symbol: '₫',
                      decimalDigits: 0,
                    ).format(double.tryParse(
                        '${widget.productModel.productPrice}') ??
                        0),
                    style: const TextStyle(fontSize: 15, color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (_quantity > 1) {
                            setState(() {
                              _quantity--;
                            });
                          }
                        },
                      ),
                      Text(
                        "$_quantity",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE4B5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xFFb9a3a9),
                          width: 1.0,
                        ),
                      ),
                      elevation: 2,
                    ),
                    onPressed: () {
                      // Mua ngay action
                    },
                    child: const Text('Mua ngay'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF80CBC4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xFFB9A3A9),
                          width: 1.0,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final cartRepo = context.read<CartRepoImpl>();

                      if (await cartRepo.isProductInCart(
                          widget.productModel.productId!)) {
                        showToast(message:'Sản phẩm đã tồn tại !');
                      } else {
                        cartRepo.addCart(
                            productId: widget.productModel.productId!,
                            customerId: 1,
                            productName: widget.productModel.productName!,
                            productPrice: widget.productModel.productPrice!,
                            productImage: widget.productModel.productImage!,
                            productQuantity: _quantity);

                        showToast(message:'Đã thêm ${widget.productModel.productName} vào giỏ hàng thành công!');
                      }
                    },
                    child: const Text('Thêm vào giỏ'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
