import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/musica_repository.dart';
import 'package:projeto_nw/models/entities/musica.dart';
import 'package:projeto_nw/view/ui/widgets/widget_button_icon_circular.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_carouseu.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_comum.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_musica_secundario.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';
import 'package:intl/intl.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<Musica> _maisUtilizadas = [];
   List<Musica> _menosUtilizadas = [];
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
    _buscarFiltrada();
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
      if (agora.hour > 5 && agora.hour < 12) {
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


   Future<void> _buscarFiltrada() async {
     final List<Musica> listaMaisUtilizadas = await MusicaRepository.instance.buscaComFiltro(clausulaOrderBy: 'contador DESC', limite: 3);
     final List<Musica> listaMenosUtilizadas = await MusicaRepository.instance.buscaComFiltro(clausulaOrderBy: 'contador ASC', limite: 3);
     setState(() {
       _maisUtilizadas = listaMaisUtilizadas;
       _menosUtilizadas = listaMenosUtilizadas;
     });
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
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtomIconCircular(
                titulo: 'Musicas',
                icon: Icon(Icons.audiotrack),
                onPressed: () {
                  print("CHAMANDO ROTA");
                  Navigator.pushNamed(context, '/musicas_page');
                  },
              ),
              ButtomIconCircular(
                titulo: 'Repertorio',
                icon: Icon(Icons.queue_music),
                onPressed: () {
                  Navigator.pushNamed(context, '/repertorio_page');
                },
              ),
              ButtomIconCircular(
                titulo: 'Membros',
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.pushNamed(context, '/membros_page');
                },
              ),
              ButtomIconCircular(
                titulo: 'Cursos',
                icon: Icon(Icons.menu_book),
                onPressed: () {
                  Navigator.pushNamed(context, '/cursos');
                },
              ),
            ],
          ),
         const SizedBox(
            height: 25,
          ),
          //TODO lista de musicas mais utilizadas
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
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
                    const SizedBox(height: 15,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          constraints: const BoxConstraints(
                              minWidth: 400
                          ),
                          height: 220,
                          decoration: BoxDecoration(
                              color: AppColors.backgroundDark2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            width: 400,
                            child:_maisUtilizadas.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:_maisUtilizadas.length ,
                                    itemBuilder: ( context, index){
                                      final musicas = _maisUtilizadas[index];
                                      return CardMusicaSecundario(
                                        nomeDaMusica: musicas.titulo,
                                        autor:musicas.autor,
                                      );
                                    }
                            ) : Center(child: Text('Lista vazia', style: TextStyle(color: AppColors.backgroundColor, fontSize: 25, fontFamily: 'Varela' ),))
                          )
                      ),

                    )
                  ],
                ),
              ),
            ),
          ),
        const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:const BoxDecoration(
                //color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(30, 30),
                    topRight: Radius.elliptical(30, 30),
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Musicas menos utilizadas', style: TextStyle(color: AppColors.backgroundDarkGreen, fontSize: 20),),
                  const SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      constraints: const BoxConstraints(
                          minWidth: 400
                      ),
                      height: 220,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundDark2,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: 400,
                        child: _menosUtilizadas.isNotEmpty
                            ? ListView.builder(
                               scrollDirection: Axis.horizontal,
                                itemCount:_menosUtilizadas.length ,
                                itemBuilder: ( context, index){
                                  final musicas = _menosUtilizadas[index];
                                  return CardMusicaSecundario(
                                    nomeDaMusica: musicas.titulo,
                                    autor:musicas.autor,
                                  );
                                }
                              )
                            : Center(child: Text('Lista vazia', style: TextStyle(color: AppColors.backgroundColor, fontSize: 25, fontFamily: 'Varela' ),))
                      )
                    ),

                  )
                ],
              ),
            ),
          ),


        ],
      ),
      /*drawer: SafeArea(
        child: Drawer(
          child: Container(
            decoration:const BoxDecoration(
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
               const SizedBox(height: 30,),
                ListTile(
                  leading:
                      const Icon(Icons.account_circle, color: AppColors.accentColor),
                  title:const Text(
                    "Membros",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
                ListTile(
                  leading:const Icon(Icons.assignment, color: AppColors.accentColor),
                  title:const Text(
                    "Ensaios",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing:const Icon(Icons.arrow_forward_ios,
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
                  const Icon(Icons.article_rounded, color: AppColors.accentColor),
                  title:const Text(
                    "Cursos",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing:const Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
                ListTile(
                  leading:
                  const Icon(Icons.queue_music, color: AppColors.accentColor),
                  title:const Text(
                    "Repertorio",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing:const Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
                ListTile(
                  leading:const Icon(Icons.audiotrack, color: AppColors.accentColor),
                  title:const Text(
                    "Musicas",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing:const Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading:const Icon(Icons.access_alarm,
                      color: AppColors.accentColor),
                  title:const Text(
                    "Cultos",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColor),
                  ),
                  trailing:const Icon(Icons.arrow_forward_ios,
                      size: 18, color: AppColors.accentColor),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),*/
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
