import 'package:flutter/material.dart';
import 'package:online_shows_shop/views/shared/app_style.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("this is cart page",style: appStyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
