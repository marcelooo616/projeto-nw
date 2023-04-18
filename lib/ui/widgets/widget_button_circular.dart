import 'package:flutter/material.dart';
import 'package:projeto_nw/util/app_colors.dart';
class ButtomCircular extends StatelessWidget {
  String? titulo;
  final VoidCallback? onPressed;
  Icon? icon;


  ButtomCircular({this.titulo, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            icon: CircleAvatar(
              backgroundColor: AppColors.appBackgroundDark2,
              radius: 75.0,
                child: Icon(icon?.icon, color: AppColors.backgroundDarkGreen,size: 50,)),
            iconSize: 75,
            onPressed: onPressed,
        ),
        Text(titulo!, style: TextStyle(fontSize: 15, color: AppColors.backgroundDarkGreen),)
      ],
    );
  }
}
