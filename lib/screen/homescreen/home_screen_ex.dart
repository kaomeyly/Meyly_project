import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_ecommerce/constants/app_image.dart';
import 'package:project_ecommerce/data/fashion_product.dart';
import 'package:project_ecommerce/models/product_model.dart';
import 'package:project_ecommerce/routes/app_route.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreenEx extends StatefulWidget {
  const HomeScreenEx({super.key});

  @override
  State<HomeScreenEx> createState() => _HomeScreenExState();
}

class _HomeScreenExState extends State<HomeScreenEx> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              "assets/img/profile.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kao Meyly",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ready to shooping!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.white.withValues(alpha: 600),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildtitlesildeshow(),
              SizedBox(height: 20),
              _buildbtn(),
              SizedBox(height: 10),
              _bulidProductItem(),
              SizedBox(height: 10),
              _buildProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildtitlesildeshow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "GOOD\nAFTERNOON!",
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
        Text(
          "Discover your unique style with KHOS AV store!",
        ),
        SizedBox(height: 20),
        _buildSlider(),
      ],
    );
  }

  Widget _buildSlider() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              debugPrint("Index page : $index");

              setState(() {
                sliderIndex = index;
              });
            },
            height: 200.0,
            viewportFraction: 0.9,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items:
              [AppImage.slider1, AppImage.slider2, AppImage.slider3].map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 15),
        AnimatedSmoothIndicator(
          activeIndex: sliderIndex,
          count: 3,
          effect: JumpingDotEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Colors.black,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildbtn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _bulidbtnItem(text: "Men's Shirts"),
              SizedBox(width: 10),
              _bulidbtnItem(text: "Women's Dresses"),
              SizedBox(width: 10),
              _bulidbtnItem(text: "Women's Shirts"),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bulidbtnItem({required String text}) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Text(text),
        ),
      ],
    );
  }

  Widget _bulidProductItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "All Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "View All",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward),
          ],
        ),
      ],
    );
  }

  Widget _buildProduct() {
    return Column(
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            mainAxisExtent: 250,
          ),
          itemBuilder: (context, index) {
            var productData = ProductModel.fromMap(fashionProducts[index]);
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.DetailPage,
                    arguments: productData);
              },
              child: _buildProductItem(productData),
            );
          },
          itemCount: fashionProducts.length,
        )
      ],
    );
  }

  Widget _buildProductItem(ProductModel productData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Color(0xffEBEBEB),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xffFF0000),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "20%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.bookmark_border_outlined,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CachedNetworkImage(
                      memCacheHeight: 400,
                      memCacheWidth: 400,
                      imageUrl: productData.thumbnail,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Color(0xffEBEBEB),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          productData.brand,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          productData.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "Price : \$${productData.price}",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget buildFooter() {
    return Row(
      children: [
        Icon(Icons.home_rounded),
        Text(
          "Home",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.bookmark_outline_outlined),
        Icon(Icons.notifications_none_outlined),
        Icon(Icons.person_outline)
      ],
    );
  }
}
