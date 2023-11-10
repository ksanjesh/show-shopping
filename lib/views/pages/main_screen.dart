import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shows_shop/controller/main_screen_controller.dart';
import 'package:online_shows_shop/views/pages/cart_page.dart';
import 'package:online_shows_shop/views/pages/home_page.dart';
import 'package:online_shows_shop/views/pages/product_bt_cart.dart';
import 'package:online_shows_shop/views/pages/profile_page.dart';
import 'package:online_shows_shop/views/pages/search_page.dart';


import '../shared/bottom_nav_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage()
  ];
  final controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: getBottomNavigationBar(),
        body: GetBuilder<MainScreenController>(builder: (logic) {
          return pageList[logic.getPageIndex];
        }));
  }

  Widget getBottomNavigationBar() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(16)),
        child: GetBuilder<MainScreenController>(builder: (logic) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(
                onTap: () {
                  controller.indexIncrement(0);
                },
                widget: logic.getPageIndex == 0
                    ?
                Column(
                        children: const [Icon(Icons.home,color: Colors.white,), Text("Home",style: TextStyle(fontSize: 10,color: Colors.white),)],
                      ):const Icon(Icons.home, color: Colors.white,),
              ),
              BottomNavWidget(
                onTap: () {
                  controller.indexIncrement(1);
                },
                widget: logic.getPageIndex == 1
                    ?
                     Column(
                        children: const [Icon(Icons.search_rounded,color: Colors.white,), Text("Search",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),)],
                      ):const Icon(Icons.search_rounded,color: Colors.white,),
              ),
              BottomNavWidget(
                onTap: () {
                  controller.indexIncrement(2);
                },
                widget: logic.getPageIndex==2 ? Column(
                  children: [Icon(Icons.add,color: Colors.white,), Text("Add",style: TextStyle(fontSize: 10,color: Colors.white),)],
                ): Icon(Icons.add,color: Colors.white,),
              ),
              BottomNavWidget(
                onTap: () {
                  controller.indexIncrement(3);
                },
                widget: logic.getPageIndex==3 ?  Column(
                  children: [Icon(Icons.shopping_cart,color: Colors.white,), Text("Cart",style: TextStyle(fontSize: 10,color: Colors.white),)],
                ):Icon(Icons.shopping_cart,color: Colors.white,),
              ),
              BottomNavWidget(
                onTap: () {
                  controller.indexIncrement(4);
                },
                widget: logic.getPageIndex==4 ? Column(
                  children: [Icon(Icons.person,color: Colors.white,), Expanded(child: Text("Profile",style: TextStyle(color: Colors.white,fontSize: 10),))],
                ): Icon(Icons.person,color: Colors.white,),
              ),
            ],
          );
        }),
      ),
    ));
  }
}
