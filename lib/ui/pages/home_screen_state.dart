import 'package:flutter/material.dart';
import 'package:projeto_nw/ui/pages/home/home_ensaios_page.dart';
import 'package:projeto_nw/util/app_colors.dart';
import 'home/home_cursos_page.dart';

import 'home/home_page.dart';


class HomeScreenState extends StatefulWidget {

  @override
  State<HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {

  int _indeceAtual = 0;
  final List<Widget> _telas = [
    HomePage(),
    EnsaioPage(),
    CursosPage(),
  ];

  void selecionarTela(int index){
    setState(() {
      _indeceAtual = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indeceAtual],
      bottomNavigationBar: Container(
        height: 75,
        child: BottomNavigationBar(
          //type: BottomNavigationBarType.shifting,
          backgroundColor:AppColors.backgroundDark2,
          elevation: 20,
          selectedFontSize: 15,
          selectedIconTheme: IconThemeData(color: AppColors.backgroundDarkGreen, size: 17,),
          selectedItemColor: AppColors.backgroundDarkGreen,
          unselectedIconTheme: IconThemeData(color: AppColors.backgroundColor),
          selectedLabelStyle: TextStyle(fontSize:15),
          unselectedItemColor: AppColors.backgroundColor,
          currentIndex: _indeceAtual,
          onTap: selecionarTela,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: Icon(Icons.home, size: 24.0), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment, size: 24.0),
                label:"Ensaios",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.article_rounded, size: 24.0),  label: "Cursos" ),
          ],

        ),
      ),
    );
  }
}
