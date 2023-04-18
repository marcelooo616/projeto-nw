import 'package:flutter/material.dart';
import 'package:projeto_nw/util/app_colors.dart';
class CardCarousel extends StatelessWidget {
  String? titulo;



  CardCarousel({this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );


  }
}
