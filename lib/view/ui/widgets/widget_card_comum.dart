import 'package:flutter/material.dart';
import 'package:projeto_nw/util/color/app_colors.dart';
class CardComum extends StatelessWidget {
  String? titulo;
  String? subtitulo;
  double? width;
  double? heigth;
  EdgeInsets? padding;
  Color? backgroundColor;
  Color? color;
  BorderRadius? borderRadius;
  double? fontSize;
  FontWeight? fontWeigth;
  final VoidCallback? onPreessed;


  CardComum(
      {this.titulo,
      this.subtitulo,
      this.width,
      this.heigth,
      this.backgroundColor,
      this.borderRadius,
      this.fontSize,
        this.padding,
        this.fontWeigth,
        this.color,
      this.onPreessed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
           onPreessed;
      },
      child: Container(
        padding: padding,
        width: width != null ? width : 200,
        height: heigth != null ? heigth : 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor != null ? backgroundColor : AppColors.secondaryColor,
          borderRadius:borderRadius != null ? borderRadius : BorderRadius.circular(15),
        ),
        child: Text(titulo! != null ? titulo! : 'Titlulo',
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeigth, color: color),),
      ),
    );
  }
}
