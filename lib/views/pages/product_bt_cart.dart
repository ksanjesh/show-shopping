import 'package:flutter/material.dart';
import 'package:online_shows_shop/json/men_shoes_json.dart';
import 'package:online_shows_shop/json/women_shoes_json.dart';
import 'package:online_shows_shop/views/shared/category_btn.dart';
import 'package:online_shows_shop/views/shared/staggered_tile.dart';

import '../../json/brand_json.dart';
import '../../json/kids_shoes_json.dart';
import '../shared/app_style.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;


  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with SingleTickerProviderStateMixin {




  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.animateTo(widget.tabIndex);
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            getFilter();
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
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
                top: MediaQuery.of(context).size.height * 0.2,
                left: 16,
                right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: TabBarView(controller: _tabController, children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: List.generate(menAllShoes.length, (index) {
                            return StaggeredTile(
                                imageUrl: menAllShoes[index]["img"].toString(),
                                name: menAllShoes[index]["name"].toString(),
                                price: "588");
                          })),
                    ],
                  ),
                ),SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: List.generate(womenAllShoes.length, (index) {
                            return StaggeredTile(
                                imageUrl:
                                   womenAllShoes[index]["img"].toString(),
                                name: womenAllShoes[index]["name"].toString(),
                                price: womenAllShoes[index]["price"].toString());
                          })),
                    ],
                  ),
                ),SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: List.generate(kidsAllShoes.length, (index) {
                            return StaggeredTile(
                                imageUrl: kidsAllShoes[index]["img"].toString(),
                                name: "sanjesh",
                                price: "588");
                          })),
                    ],
                  ),
                ),

              ]),
            ),
          )
        ],
      ),
    );
  }

 getFilter() {
    double _value = 100;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        enableDrag: true,
        isDismissible: true ,
        isScrollControlled: true,
        barrierColor: Colors.white54,
        builder:(_)=>
      StatefulBuilder(builder: (context, setState){
        return Container(
          height: MediaQuery.of(context).size.height*0.82,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20,),topRight: Radius.circular(20)),
              color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,

                ),
                Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black38
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text("Filter",style: appStyle(40, Colors.black, FontWeight.bold),),
                    SizedBox(height: 25,),
                    Text("Gender",style: appStyle(20, Colors.black, FontWeight.w600),),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryBtn(
                              label : "Men",
                              buttonClr : Colors.black

                          ),CategoryBtn(
                              label : "Women",
                              buttonClr : Colors.grey

                          ),CategoryBtn(
                              label : "Kids",
                              buttonClr : Colors.grey

                          )
                        ],
                      ),

                    ),
                    SizedBox(height: 20,),
                    Text("Category",style: appStyle(20, Colors.black, FontWeight.w600),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryBtn(
                              label : "Shoes",
                              buttonClr : Colors.black

                          ),
                          CategoryBtn(
                              label : "Apparrels",
                              buttonClr : Colors.grey

                          ),
                          CategoryBtn(
                              label : "Accessories",
                              buttonClr : Colors.grey

                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Price",style: appStyle(20, Colors.black, FontWeight.bold),),

                    Slider(
                        value: _value,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                       divisions: 20,
                        label: _value.toString(),

                        onChanged: (double value){
                          setState(() {
                            _value = value;
                          });

                        }),
                    SizedBox(height: 15,),
                    Text("Brand",style: appStyle(20, Colors.black, FontWeight.bold),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:  brandJson.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context ,index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                 borderRadius: BorderRadius.circular(12)
                              ),
                              child: Image.network(brandJson[index]["img"],height:40,width: 60,),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

        );
      })
    );

 }
}
