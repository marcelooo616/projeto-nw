import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/musica_repository.dart';
import 'package:projeto_nw/models/entities/evento.dart';
import 'package:projeto_nw/models/entities/musica.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_musica_primario.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';
class DetalhesEvento extends StatefulWidget {
 Evento? evento;


 DetalhesEvento({this.evento});

  @override
  State<DetalhesEvento> createState() => _DetalhesEventoState();
}

class _DetalhesEventoState extends State<DetalhesEvento> {
  List<Musica> _musicas = [];
  bool _carregando = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buscarMusicasFiltrada(widget.evento!.repertorio!);
    _carregarDados().then((_) {
      setState(() {
        _carregando = false;
      });
    });
    print(widget.evento!.repertorio!);
  }

  Future<void> _carregarDados() async {
    // Simule um carregamento
    await Future.delayed(Duration(seconds: 2));
  }


  Future<void> _buscarMusicasFiltrada(String repertorio) async {
   // if (_evento?.repertorio == null) return;
    final List<Musica> listaDeEnsaio =
    await MusicaRepository.instance.listaFiltrada(repertorio);
    setState(() {
      _musicas = listaDeEnsaio;
    });
    print(_musicas.length);

  }



  @override
  Widget build(BuildContext context) {
    //Evento evento = ModalRoute.of(context)?.settings.arguments as Evento;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(title: LogoNewWine(),),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: ListView(
          children: [
            Center(
            child: Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundDarkGreen,
                    borderRadius: BorderRadius.circular(50)
                  ),
                    child:  Text('${widget.evento!.titulo}', style: TextStyle(fontSize: 35, fontFamily: 'Varela', fontWeight: FontWeight.bold),)),

                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        color: AppColors.backgroundColorCard
                      ),
                        child:  Text('${widget.evento!.tipo}', style: TextStyle(fontSize: 20, fontFamily: 'Varela', fontWeight: FontWeight.w400, color: AppColors.backgroundColor),),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.backgroundColorCard
                      ),
                      child:  Text('${widget.evento!.horario}', style: TextStyle(fontSize: 20, fontFamily: 'Varela', fontWeight: FontWeight.w400, color: AppColors.backgroundColor),),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.backgroundColorCard
                      ),
                      child:  Text('${widget.evento!.data}', style: TextStyle(fontSize: 20, fontFamily: 'Varela', fontWeight: FontWeight.w400, color: AppColors.backgroundColor),),
                    ),
                  ],
                ),
              ],
            )
            ),

            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColorCard,
                borderRadius: BorderRadius.circular(20)
              ),

              height: 500,
              child: Flex(
                direction: Axis.vertical,
                children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 24 + 0.5, horizontal: 20),
                      alignment: Alignment.centerLeft,
                      child: Text('Repertorio', style: TextStyle(color: AppColors.backgroundColor, fontSize: 20, fontFamily: 'Varela', fontWeight: FontWeight.w400),),
                    ),
                    Container(
                      height: 425
                      ,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundDark2,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight:Radius.circular(20))
                      ),
                      child: Visibility(
                        visible: _carregando,
                        child:Center(
                          child: CircularProgressIndicator(color: AppColors.backgroundDarkGreen),
                        ),
                        replacement: ListView.builder(
                          itemCount: _musicas.length,
                            itemBuilder: (context, index){
                            final musicas = _musicas[index];
                            return  CardMusicaPrimario(
                                nomeDaMusica: musicas.titulo,
                                nomeDoAutor: musicas.autor,
                                tomDaMusica:musicas.tom ,
                                idCantor:musicas.idCantorSolo ,

                            );
                            }
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
