import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_nw/ui/widgets/widget_button_circular.dart';
import 'package:projeto_nw/ui/widgets/widget_card_carouseu.dart';
import 'package:projeto_nw/ui/widgets/widget_card_comum.dart';
import 'package:projeto_nw/ui/widgets/widget_card_musica.dart';
import 'package:projeto_nw/ui/widgets/widget_card_musica_home.dart';
import 'package:projeto_nw/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    "Dedique tempo para praticar diariamente e aprimore suas habilidades.",
    "Ouça uma grande variedade de música para expandir seu repertório.",
    "Aprenda a ler partituras para entender melhor a música.",
    "Mantenha seus instrumentos limpos e bem cuidados.",
    "Não tenha medo de cometer erros; eles fazem parte do aprendizado.",
    "Mantenha-se aberto a diferentes estilos e gêneros musicais.",
    "Esteja sempre aberto a aprender e se desafiar.",
    "Preste atenção na dinâmica e na expressão musical enquanto toca.",
    "Encontre sua própria voz musical e estilo pessoal."
  ];

  String saudacao = '';
  @override
  void initState() {
    super.initState();

    atualizarSaudacao().then((value) {
      setState(() {
        saudacao = value;
      });
    });
  }

  Future<String> atualizarSaudacao() async {
    try {
      final agora = DateTime.now();

      // Formatando a hora
      final formatter = DateFormat.Hm();
      final horaFormatada = formatter.format(agora);

      // Atualizando a saudação de acordo com a hora
      if (agora.hour < 12) {
        return 'Olá! Bom dia';
      } else if (agora.hour < 18) {
        return 'Olá! Boa tarde';
      } else {
        return 'Olá! Boa noite';
      }
    } catch (e) {
      // Caso haja erro na requisição, retornar uma mensagem genérica
      return 'Olá!';
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(title: LogoNewWine()),
      body: ListView(
        padding: EdgeInsets.only(top: 55),
        children: [
          Row(
            children: [
              CardComum(
                width: 200,
                heigth: 50,
                padding: EdgeInsets.only(left: 20),
                titulo: saudacao,
                backgroundColor: Colors.black,
                borderRadius: BorderRadius.circular(15),
                fontSize: 25,
                color: AppColors.backgroundColor,
              ),
            ],
          ),
          SizedBox(height: 30,),
          CarouselSlider(
              items: items
                  .map((element) => CardCarousel(
                        titulo: element,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 150,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 2,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  // Ação a ser executada quando a página é alterada
                },
                scrollDirection: Axis.horizontal,
              )),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtomCircular(
                titulo: 'Musicas',
                icon: Icon(Icons.audiotrack),
                onPressed: () {
                  print("CHAMANDO ROTA");
                  Navigator.pushNamed(context, '/musicas_page');
                  },
              ),
              ButtomCircular(
                titulo: 'Repertorio',
                icon: Icon(Icons.queue_music),
                onPressed: () {

                },
              ),
              ButtomCircular(
                titulo: 'Membros',
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.pushNamed(context, '/membros_page');
                },
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          //TODO lista de musicas mais utilizadas
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  //color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(30, 30),
                      topRight: Radius.elliptical(30, 30),
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Musicas mais utilizadas', style: TextStyle(color: AppColors.backgroundDarkGreen, fontSize: 20),),
                    ),
                    SizedBox(height: 15,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 400
                        ),
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundDark2,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: <Widget>[
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                          ],
                        ),
                      ),

                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  //color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(30, 30),
                      topRight: Radius.elliptical(30, 30),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Musicas menos utilizadas', style: TextStyle(color: AppColors.backgroundDarkGreen, fontSize: 20),),
                    ),
                    SizedBox(height: 15,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        constraints: BoxConstraints(
                            minWidth: 400
                        ),
                        height: 200,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundDark2,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: <Widget>[
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                            CardMusicaHome(),
                          ],
                        ),
                      ),

                    )
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: ListView(
              children: [
                /*UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/nw.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.transparent.withOpacity(0.1),
                            BlendMode.colorBurn)),
                  ),
                ),*/
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading:
                      Icon(Icons.account_circle, color: AppColors.accentColor),
                  title: Text(
                    "Membros",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.assignment, color: AppColors.accentColor),
                  title: Text(
                    "Ensaios",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.article_rounded, color: AppColors.accentColor),
                  title: Text(
                    "Cursos",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
                ListTile(
                  leading:
                      Icon(Icons.queue_music, color: AppColors.accentColor),
                  title: Text(
                    "Repertorio",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.audiotrack, color: AppColors.accentColor),
                  title: Text(
                    "Musicas",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.access_alarm,
                      color: AppColors.accentColor),
                  title: Text(
                    "Cultos",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
