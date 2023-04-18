import 'package:flutter/material.dart';
import 'package:projeto_nw/ui/pages/home/home_cantores_page.dart';
import 'package:projeto_nw/ui/pages/home/home_musica_page.dart';
import 'package:projeto_nw/ui/pages/home/home_page.dart';
import 'package:projeto_nw/ui/pages/home_screen_state.dart';
import 'package:projeto_nw/ui/pages/screens/forms_screen/adicionar_cantores_page.dart';
import 'package:projeto_nw/ui/pages/screens/forms_screen/adicionar_cifra_musical.dart';
import 'package:projeto_nw/ui/pages/screens/forms_screen/adicionar_musica_page.dart';
import 'package:projeto_nw/util/app_colors.dart';


void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWWINE DEMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.appBackgroundDark2,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreenState(),
        '/home_page': (context) => HomePage(),
        '/musicas_page': (context) => MusicasPage(),
        '/adicionar_musica': (context) => AdicionarMusicaScreen(),
        '/adicionar_cantor': (context) => AdicionarCantorPage(),
        '/membros_page': (context) => CantoresPageScreen(),
        //'/detalhes_musica': (context) => DetalhesMusica(),
        '/adicionar_cifra': (context) => MinhaPagina(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeScreenState();
  }
}