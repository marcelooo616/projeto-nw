import 'package:flutter/material.dart';
import 'package:projeto_nw/util/icons/calendar_icons.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';


class CursosPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: LogoNewWine(),),
      body:Padding(
        padding: const EdgeInsets.only(top: 75, left: 20, right: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.backgroundDarkGreen,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Notas musicais', style: TextStyle(fontFamily: 'Varela', fontSize: 20),),
                      )
                  ),Flexible(
                    flex: 1,
                      child: Container(
                        child: Icon(Calendar.right_open_big, size: 35,)
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.backgroundDarkGreen,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Escalas musicais', style: TextStyle(fontFamily: 'Varela', fontSize: 20),),
                      )
                  ),Flexible(
                      flex: 1,
                      child: Container(
                          child: Icon(Calendar.right_open_big, size: 35,)
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.backgroundDarkGreen,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Ritmo', style: TextStyle(fontFamily: 'Varela', fontSize: 20),),
                      )
                  ),Flexible(
                      flex: 1,
                      child: Container(
                          child: Icon(Calendar.right_open_big, size: 35,)
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.backgroundDarkGreen,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Leitura de partituras', style: TextStyle(fontFamily: 'Varela', fontSize: 20),),
                      )
                  ),Flexible(
                      flex: 1,
                      child: Container(
                          child: Icon(Calendar.right_open_big, size: 35,)
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.backgroundDarkGreen,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Acordes', style: TextStyle(fontFamily: 'Varela', fontSize: 20),),
                      )
                  ),Flexible(
                      flex: 1,
                      child: Container(
                          child: Icon(Calendar.right_open_big, size: 35,)
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.backgroundDarkGreen,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Intervalos', style: TextStyle(fontFamily: 'Varela', fontSize: 20),),
                      )
                  ),Flexible(
                      flex: 1,
                      child: Container(
                          child: Icon(Calendar.right_open_big, size: 35,)
                      )
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.backgroundDarkGreen,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Harmonia básica', style: TextStyle(fontFamily: 'Varela', fontSize: 20),),
                      )
                  ),Flexible(
                      flex: 1,
                      child: Container(
                          child: Icon(Calendar.right_open_big, size: 35,)
                      )
                  ),
                ],
              ),
            ),

          ],
        ),
      )

    );
  }
}
