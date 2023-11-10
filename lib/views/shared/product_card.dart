import 'package:flutter/material.dart';
import 'package:online_shows_shop/views/pages/product_details_page.dart';
import 'package:online_shows_shop/views/shared/app_style.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image, required this.similarProduct})
      : super(key: key);
  final String price;
  final String category;
  final String id;
  final String name;
  final String image;
  final List similarProduct;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsPage(
                      networkImage: widget.image,
                      name: widget.name,
                      category: widget.category,
                      price: widget.price,
                      similarProduct: widget.similarProduct,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1),
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(widget.image),
                      )),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.favorite_border),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),
                      Text(
                        widget.category,
                        style: appStyle(
                          14,
                          Colors.grey,
                          FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.price,
                            style: appStyle(25, Colors.black, FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "Colors",
                                style:
                                    appStyle(18, Colors.grey, FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ChoiceChip(
                                label: Text(""),
                                selected: selected,
                                visualDensity: VisualDensity.compact,
                                selectedColor: Colors.black,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}