import 'package:flutter/material.dart';
import 'package:online_shows_shop/json/women_shoes_json.dart';
import 'package:online_shows_shop/views/shared/app_style.dart';
import 'package:online_shows_shop/views/shared/home_widget.dart';
import 'package:online_shows_shop/views/shared/product_card.dart';

import '../../json/kids_shoes_json.dart';
import '../../json/men_shoes_json.dart';
import '../shared/latest_shoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.fill)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Athletics Shoes",
                        style: appStyleWithHt(
                            35, Colors.white, FontWeight.bold, 1.2),
                      ),
                      Text(
                        "Collection",
                        style: appStyleWithHt(
                            35, Colors.white, FontWeight.bold, 1.2),
                      ),
                      TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appStyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.5),
                          tabs: [
                            Tab(
                              text: "Mens Shows",
                            ),
                            Tab(
                              text: "Womens Shows",
                            ),
                            Tab(
                              text: "Kids Shows",
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.27),
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(productShoesList: menShoesJson, tabIndex: 0, similarProduct: menLatestShoes,),
                    HomeWidget(productShoesList: womenShoesJson, tabIndex: 1, similarProduct: womenLatestShoes,),
                    HomeWidget(productShoesList: kidsShoesJson, tabIndex: 2, similarProduct: kidsLatestShoes,)
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
