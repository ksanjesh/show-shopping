import 'package:flutter/material.dart';
import 'package:online_shows_shop/views/shared/app_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("this is search page",style: appStyle(20, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
