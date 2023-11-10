import 'package:flutter/material.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({Key? key, required this.networkImage}) : super(key: key);
  final String networkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context)
          .size
          .height *
          0.12,
      width: MediaQuery.of(context)
          .size
          .width *
          0.28,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(networkImage,),fit: BoxFit.cover
        ),
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.5,
                offset: Offset(1, 3)),
          ]),

    );
  }
}
