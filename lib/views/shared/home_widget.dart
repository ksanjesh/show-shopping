import 'package:flutter/material.dart';
import 'package:online_shows_shop/views/pages/product_bt_cart.dart';
import 'package:online_shows_shop/views/shared/product_card.dart';

import '../../json/men_shoes_json.dart';
import 'app_style.dart';
import 'latest_shoes.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, required this.productShoesList, required this.tabIndex, required this.similarProduct}) : super(key: key);
 final List productShoesList;
 final int tabIndex;
 final List similarProduct;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: ListView.builder(
              itemCount: productShoesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCard(
                  price: productShoesList[index]["price"],
                  category: productShoesList[index]["category"],
                  id: productShoesList[index]['id'],
                  name: productShoesList[index]['name'],
                  image: productShoesList[index]['img'],
                  similarProduct: similarProduct,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appStyle(
                        24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductByCart(tabIndex: tabIndex,)));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appStyle(
                              20,
                              Colors.black.withOpacity(0.5),
                              FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_right,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height:
                MediaQuery.of(context).size.height * 0.13,
                child: ListView.builder(
                    itemCount: menLatestShoes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LatestShoes(networkImage: similarProduct[index]["img"],),
                      );
                    }),
              )
            ],
          ),
        )
      ],
    );
  }

}
