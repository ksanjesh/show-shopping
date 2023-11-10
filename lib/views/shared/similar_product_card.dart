import 'package:flutter/material.dart';

class SimilarProductCard extends StatelessWidget {
  const SimilarProductCard({Key? key, required this.img, required this.name}) : super(key: key);
  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.2),
        ),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(img),
                        fit: BoxFit.contain),
                    borderRadius:
                    BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 150,
                  width:
                  MediaQuery.of(context).size.width *
                      0.35,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.45,
                      child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,)),
                  Text("sanjesh"),
                  Text("tikddmsm")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
