import 'package:flutter/material.dart';
import 'package:projeto_nw/util/app_colors.dart';

class CardMusicaHome extends StatelessWidget {
  const CardMusicaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: AppColors.greyColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage('assets/images/cd.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vem me buscar', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.backgroundColor),),
                  SizedBox(height: 5,),
                  Text('Jefferson e Suellen', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.greyColor),),

                ],
              ),
            )
          ],
        ),
      ),


    );
  }
}
