import 'package:flutter/material.dart';
import 'package:projeto_nw/util/color/app_colors.dart';

class LogoNewWine extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          RichText(text: TextSpan(children: [
          TextSpan(text: "NEW", style: TextStyle(fontSize:25 ,color: AppColors.greyColor, fontWeight: FontWeight.bold)),
          TextSpan(text: "WINE", style: TextStyle(fontSize:25 ,color: AppColors.secondaryColor, fontWeight: FontWeight.bold))
        ])),
    );
  }
}
