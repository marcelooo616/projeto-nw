import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/Repertorio_repository.dart';

import 'package:projeto_nw/models/data/repository/cantor_repository.dart';
import 'package:projeto_nw/models/data/repository/musica_repository.dart';
import 'package:projeto_nw/models/entities/cantor.dart';
import 'package:projeto_nw/models/entities/musica.dart';
import 'package:projeto_nw/models/entities/repetorio.dart';
import 'package:projeto_nw/view/ui/pages/forms_screen/adicionar_musica_page.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_musica_primario.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';



class MusicasPage extends StatefulWidget {

  @override
  _MusicasPageState createState() => _MusicasPageState();
}

class _MusicasPageState extends State<MusicasPage> {
  List<Musica> _musicas = [];
  List<Cantor> _cantores = [];
  List<Repertorio> _playlist = [];


  @override
  void initState() {
    super.initState();
    _buscarTodasMusicas();
    _buscarTodosOsCantores();
   _listandoMusicas();

  }

  Future<void> _buscarTodasMusicas() async {
    final List<Musica> listaDeEnsaio =
    await MusicaRepository.instance.retornarTodos();
    setState(() {
      _musicas = listaDeEnsaio;
    });
  }

  Future<void> _buscarTodosOsCantores() async {
    final List<Cantor> listaDeCantores =
    await CantorRepository.instance.retornarTodos();
    setState(() {
      _cantores = listaDeCantores;
    });
  }

  Future<void> _listandoMusicas() async {
    final List<Repertorio> listaEnsaio =
    await RepertorioRepository.instance.retornarTodos();
    setState(() {
      _playlist = listaEnsaio;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: LogoNewWine(), ),
      body: Container(
        decoration: BoxDecoration(
           color: AppColors.primaryColor
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [

            Column(
              children: [
               /* Container(
                  child: _playlist.isNotEmpty
                    ? Text('Suas Playlist',style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela', fontSize: 25),)
                    : Text('lista de playlist vazia',style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela', fontSize: 25),),

                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(top: 22, left: 20, right: 20),
                  height: 250,
                  decoration: BoxDecoration(
                     color: AppColors.backgroundDark2,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: _playlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Repertorio playlist = _playlist[index];
                        return CardRepertorio(
                          playlist: playlist,
                            rota: '/detalhes_playlist',
                            titulo: playlist.titulo,
                            descricao: playlist.descricao,
                            primeiraCorTema: Color(
                                int.parse(playlist.primeiraCorTema!, radix: 16))
                                .withOpacity(1.0),
                            segundaCorTema: Color(
                                int.parse(playlist.segundaCorTema!, radix: 16))
                                .withOpacity(1.0));
                      }),
                ),*/
              ],
            ),
            SizedBox(height: 35,),
            Container(
             height: 700,
            // padding: EdgeInsets.only(top: 50),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(55), topRight:Radius.circular(55)),
               color: AppColors.backgroundDark2,

             ),
             child: Column(
               children: [
                 SizedBox(height: 13,),
                 Divider( color:Colors.grey[500], thickness: 4, endIndent: 175, indent: 175 ),
                 SizedBox(height: 50,),
                 Flex(
                   direction: Axis.vertical,
                   children:[
                     Container(
                     child:_musicas.isNotEmpty
                         ? Text('Suas musicas', style: TextStyle(color: AppColors.backgroundColor, fontSize: 25, fontFamily: 'Varela'),)
                         : Text('Sua lista de musicas esta vazia', style: TextStyle(color: AppColors.backgroundColor, fontSize: 25, fontFamily: 'Varela'),),
                   ),
                   ]
                 ),
                 SizedBox(height: 25,),
                 Container(
                   height: 550,
                   child: ListView.builder(
                       physics: AlwaysScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: _musicas.length,
                       itemBuilder: (context, index){
                         final musica = _musicas[index];
                         return   Dismissible(
                           key: Key(musica.id.toString()),
                           direction: DismissDirection.startToEnd,
                           background: Container(
                             color: Colors.red,
                             child: Align(
                               alignment: Alignment.centerLeft,
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 40),
                                 child: Row(
                                   children: [
                                     Icon(
                                       Icons.delete_outline,
                                       color: Colors.white,
                                       size: 35,
                                     ),
                                     Text('Deletar', style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Varela', fontSize: 15),)
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           onDismissed: (direction) async{
                            await MusicaRepository.instance.deletarMusica(musica.id!);
                             setState(() {
                               print('[LOG] APAGANDO O MUSICA ID - ${musica.id}');
                               _buscarTodasMusicas();
                             }

                             );

                           },
                           confirmDismiss: (direction) async {
                             return await showDialog(
                               context: context,
                               builder: (BuildContext context) {
                                 return AlertDialog(
                                   backgroundColor: AppColors.backgroundDark2,
                                   title: Text("Excluir item", style: TextStyle(color: AppColors.backgroundColor),),
                                   content: Text("Tem certeza que deseja excluir este item?",style: TextStyle(color: AppColors.backgroundColor)),
                                   actions: <Widget>[
                                     TextButton(
                                       onPressed: () => Navigator.of(context).pop(false),
                                       child: Text("Cancelar", style: TextStyle(color: AppColors.backgroundColor)),
                                     ),
                                     TextButton(
                                       onPressed: () => Navigator.of(context).pop(true),
                                       child: Text("Excluir",style: TextStyle(color: AppColors.backgroundColor)),
                                     ),
                                   ],
                                 );
                               },
                             );
                           },
                           child: CardMusicaPrimario(
                             tomDaMusica: musica.tom ,
                             nomeDoAutor: musica.autor,
                             nomeDaMusica: musica.titulo ,
                             idCantor: musica.idCantorSolo,
                           ),
                         );

                       }),
                 ),
               ],
             ),
           )

        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundDarkGreen,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AdicionarMusicaScreen()
            ;
          }));
        },
        child: const Icon(
          Icons.add,
          color: AppColors.primaryColor,
        ),
      ),

    );


  }
}

