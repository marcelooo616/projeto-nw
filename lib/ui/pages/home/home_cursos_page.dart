import 'package:flutter/material.dart';
import 'package:projeto_nw/util/app_colors.dart';

class CursosPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: RichText(text: TextSpan(children: [
              TextSpan(text: "NEW", style: TextStyle(fontSize:25 ,color: AppColors.greyColor, fontWeight: FontWeight.bold)),
              TextSpan(text: "WINE", style: TextStyle(fontSize:25 ,color: AppColors.secondaryColor, fontWeight: FontWeight.bold))
            ]))
        ),
        body: Scaffold(
          body: Container(
            child: Center(child: Text("CURSOS")),
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}