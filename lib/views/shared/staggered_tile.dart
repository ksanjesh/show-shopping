import 'package:flutter/material.dart';
import 'package:online_shows_shop/views/shared/app_style.dart';

class StaggeredTile extends StatefulWidget {
  const StaggeredTile(
      {Key? key, required this.imageUrl, required this.name, required this.price})
      : super(key: key);
  final String imageUrl;
  final String name;
  final String price;


  @override
  State<StaggeredTile> createState() => _StaggeredTileState();
}

class _StaggeredTileState extends State<StaggeredTile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      width: (size.width - 55) / 2,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: (size.width - 55) / 2,
                height: (size.width - 120) / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.imageUrl),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(onTap: () {

                },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, color: Colors.grey,
                        size: 22,),
                    ),

                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                  maxLines: 2,
                  style: TextStyle(

                    fontSize: 16,
                    fontWeight: FontWeight.w600,

                  ),), Text("${widget.price}",
                  maxLines: 1,
                  style: TextStyle(

                    fontSize: 16,
                    fontWeight: FontWeight.w600,

                  ),),

                SizedBox(height: 10,),

              ],
            ),
          )

        ],
      ),
    );
  }
}
