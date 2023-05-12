import 'package:flutter/material.dart';
import 'package:projeto_nw/view/ui/pages/detail_screen/detalhes_evento_page.dart';
import 'package:projeto_nw/view/ui/pages/detail_screen/detalhes_playlist_page.dart';
import 'package:projeto_nw/view/ui/pages/forms_screen/adicionar_ensaio_page.dart';
import 'package:projeto_nw/view/ui/pages/forms_screen/adicionar_musica_page.dart';
import 'package:projeto_nw/view/ui/pages/home/home_cantores_page.dart';
import 'package:projeto_nw/view/ui/pages/home/home_cursos_page.dart';
import 'package:projeto_nw/view/ui/pages/home/home_musica_page.dart';
import 'package:projeto_nw/view/ui/pages/home/home_page.dart';
import 'package:projeto_nw/view/ui/pages/home/home_repertorios_page.dart';
import 'package:projeto_nw/view/ui/pages/home_screen_state.dart';

import 'package:projeto_nw/view/ui/pages/forms_screen/adicionar_cantores_page.dart';
import 'package:projeto_nw/view/ui/pages/forms_screen/adicionar_cifra_musical.dart';
import 'package:projeto_nw/view/ui/pages/forms_screen/adicionar_evento_page.dart';
import 'package:projeto_nw/view/ui/widgets/widget_lista_de_musicas.dart';
import 'package:projeto_nw/util/color/app_colors.dart';


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
        '/adicionar_ensaio': (context) => AdicionarEnsaioScreen(),
        '/adicionar_cantor': (context) => AdicionarCantorPage(),
        '/membros_page': (context) => CantoresPageScreen(),
        '/repertorio_page': (context) => RepertorioPage(),
        '/adicionar_cifra': (context) => MinhaPagina(),
        '/lista_de_musicas': (context) => ListaDeMusicas(),
        '/detalhes_playlist': (context) => DetalhesPlaylist(),
        '/adicionarEvento': (context) => AdicionarEventoPage(),
        '/detalhesEvento': (context) => DetalhesEvento(),
        '/cursos': (context) => CursosPage(),
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