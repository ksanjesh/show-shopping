import 'package:flutter/material.dart';
import 'package:online_shows_shop/views/shared/app_style.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({Key? key, required this.buttonClr, required this.label}) : super(key: key);
  final Color  buttonClr;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width*0.30,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: buttonClr,style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(10),

      ),
      child: MaterialButton(
          onPressed: (){},
          child: Center(child: FittedBox(
            fit: BoxFit.cover,
              child: Text(label,style: TextStyle(color: buttonClr),))),
      ),
    );
  }

}
