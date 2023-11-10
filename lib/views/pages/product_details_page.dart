import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_shows_shop/json/shoes_details_json.dart';

import '../shared/app_style.dart';
import '../shared/similar_product_card.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
      {Key? key,
      required this.networkImage,
      required this.name,
      required this.category,
      required this.price,
      required this.similarProduct})
      : super(key: key);
  final String networkImage;
  final String name;
  final String category;
  final String price;
  final List similarProduct;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final PageController _pageController = PageController();

  int? _value = 1; //false;

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(15)),
                    color: Colors.black,
                  ),
                  child: Center(
                      child: Text(
                    "Buy Now",
                    style: appStyle(15, Colors.white, FontWeight.w500),
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(15)),
                    color: Colors.orangeAccent,
                  ),
                  child: Center(
                      child: Text(
                    "Add to Cart",
                    style: appStyle(15, Colors.black, FontWeight.w500),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFE2E2E2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(25),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 10, bottom: 5, left: 20),
                    child: Text(
                      widget.name,
                      style: appStyle(20, Colors.black, FontWeight.bold),
                    )),
              ),
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height * 0.45,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  color: Colors.grey.shade300,
                  child: Stack(
                    children: [
                      PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _activePage = page;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, int index) {
                            return Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Image.network(
                                    widget.networkImage,
                                    fit: BoxFit.contain,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            );
                          }),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.1,
                          right: 22,
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.1)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.favorite_border),
                              ))),
                      Positioned(
                          bottom: 50,
                          left: 0,
                          right: 0,
                          height: 50,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(4, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: InkWell(
                                    onTap: () {
                                      _pageController.animateToPage(index,
                                          duration: Duration(microseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: _activePage == index
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ))
                    ],
                  ),
                ),
              )),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.category,
                          style: appStyle(18, Colors.grey, FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: 3.4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemSize: 14,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.only(right: 1),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.red,
                                ),
                            onRatingUpdate: (rating) {}),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.price,
                          style: appStyle(20, Colors.black, FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              "Colors",
                              style:
                                  appStyle(18, Colors.black, FontWeight.w500),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.orange,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Select sizes",
                          style: appStyle(17, Colors.black, FontWeight.w600),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "View size guide",
                          style: appStyle(13, Colors.grey, FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(mensShoesSize.length, (index) {
                          return ChoiceChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                  side: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                      style: BorderStyle.solid)),
                              disabledColor: Colors.white,
                              label: Text(
                                mensShoesSize[index].toString(),
                                style: TextStyle(
                                    color:
                                        _value == index ? Colors.white : null),
                              ),
                              selectedColor: Colors.black54,
                              backgroundColor: Colors.white,
                              selected: _value == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  _value = selected ? index : null;
                                });
                              });
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    Text(
                      "Addidas Running Shoes With Cooling Ventilation",
                      style: appStyle(20, Colors.black, FontWeight.w700),
                    ),
                    Text(
                      "sanjeshAnkle-length shoes with open-lacing and 2-3 pairs of eyelets only,"
                      " made with leather or suede,"
                      " and with leather or rubber sole. Mostly, chukka boots are monochromatic, with their lace, sole and leather"
                      "color matching each other. Traditionally worn as protective footwear by miners and farmers,  clog shoes are made either partially or entirely from wood.",
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Similar Products",
                          style: appStyle(20, Colors.black, FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: List.generate(widget.similarProduct.length,
                              (index) {
                            return SimilarProductCard(img: widget.similarProduct[index]["img"], name: widget.similarProduct[index]["name"].toString());
                          }),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
