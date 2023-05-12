import 'package:flutter/material.dart';
import 'package:projeto_nw/util/color/app_colors.dart';
class CardCarousel extends StatelessWidget {
  String? titulo;



  CardCarousel({this.titulo});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: const Color(0xFF85FFBD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Container(
        width: 500,
        height: 200,
        decoration: BoxDecoration(
          gradient:const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:  [
              AppColors.backgroundDarkGreen,
              Color(0xFFFC00FF),
            ],
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:  RichText(
            text:  TextSpan(
              style: TextStyle(fontSize: 16),
              children: [

                TextSpan(text: titulo!, style: TextStyle(fontSize: 25, fontFamily: 'Lato', fontWeight: FontWeight.w400, color: AppColors.primaryColor)),
                WidgetSpan(child: Divider(height:5,color: AppColors.backgroundDark,thickness: 15,indent: 10, endIndent: 100),),

                //TextSpan(text: '\n playlist ', style: TextStyle(fontSize: 60, fontFamily: 'Lato', fontWeight: FontWeight.w900, color: AppColors.backgroundDark2)),
              ],
            ),
          ),
        ),
      ),
    );/* Container(
      width: 500,
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          border: Border.all(),
          borderRadius: BorderRadius.circular(5.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Text(
              titulo!,
              style: TextStyle(
                color: AppColors.backgroundDarkGreen,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.wb_incandescent,
                color: AppColors.backgroundDarkGreen,
              )
            ],
          )
        ],
      ),
    );*/


  }
}
