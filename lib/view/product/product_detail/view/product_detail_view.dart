
import 'package:flutter/material.dart';

import '../../../home/model/home_model.dart';
import '../service/product_detail_service.dart';
import 'product_detail_home_view.dart';


class ProductDetailView extends ProductDetailViewModel {
  String productId = "62a1acec218de6fa8eafc824";
  bool _isLoading = false;
  ProductModel? _productDetail;
  late ProductDetailService productDetailService;

  @override
  void initState() {
    super.initState();
    productDetailService = ProductDetailService();
    getAll();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  // Future<void> fetchProduckDetail(String Id) async {
  //   _changeLoading();
  //   _productDetail = await _detailService.fetchProductItemWithId(Id);
  //   _changeLoading();
  // }

  Future<void> getAll() async {
    _changeLoading();
    _productDetail = await productDetailService.fetchProductDetail(productId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.05),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -50,
                          height: size.height * 0.6,
                          width: size.width * 0.9,
                          child: _MainProductImage(
                              imagePath:
                                  "${_productDetail?.productImages?.first}"),
                        ),
                        Positioned(
                          height: size.height * 0.13,
                          width: size.width * 0.89,
                          bottom: -(size.height * 0.0008),
                          left: (size.width * 0.003),
                          child: _CustomCard(productDetail: _productDetail),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02),
                          child: Column(
                            children: [
                              Text(
                                "Gallery",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _GalleryImage(
                                  size: size,
                                  path:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkIWznVKn2K1DM2LfvKvZAP_252_ALL0kWXw&usqp=CAU"),
                              _GalleryImage(
                                  size: size,
                                  path:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkIWznVKn2K1DM2LfvKvZAP_252_ALL0kWXw&usqp=CAU"),
                              _GalleryImage(
                                  size: size,
                                  path:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkIWznVKn2K1DM2LfvKvZAP_252_ALL0kWXw&usqp=CAU"),
                              _GalleryImage(
                                  size: size,
                                  path:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkIWznVKn2K1DM2LfvKvZAP_252_ALL0kWXw&usqp=CAU"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: Text(
                            "Description",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: _DescriptionText(
                              descriptionText:
                                  "${_productDetail?.description}"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({
    Key? key,
    required this.descriptionText,
  }) : super(key: key);

  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Text(
      descriptionText,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(color: Colors.black54),
    );
  }
}

class _GalleryImage extends StatelessWidget {
  const _GalleryImage({
    Key? key,
    required this.size,
    required this.path,
  }) : super(key: key);

  final Size size;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.30,
      height: size.height * 0.099,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

  final ProductModel? productDetail;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _TitleText(title: "${productDetail?.name}"),
                _PriceText(price: "${productDetail?.price}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _AddressText(
                    address:
                        "${productDetail?.city} ${productDetail?.district}"),
                _MailText(mail: "${productDetail?.createdAt}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MailText extends StatelessWidget {
  const _MailText({
    Key? key,
    required this.mail,
  }) : super(key: key);
  final String mail;

  @override
  Widget build(BuildContext context) {
    return Text(
      mail,
      style:
          Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),
    );
  }
}

class _AddressText extends StatelessWidget {
  const _AddressText({
    Key? key,
    required this.address,
  }) : super(key: key);

  final String address;
  @override
  Widget build(BuildContext context) {
    return Text(
      address,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Colors.white,
          ),
    );
  }
}

class _PriceText extends StatelessWidget {
  const _PriceText({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\$ ${price}",
      style:
          Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _MainProductImage extends StatelessWidget {
  const _MainProductImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: BoxFit.fill,
    );
  }
}
