import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/evento_repository.dart';
import 'package:projeto_nw/models/entities/evento.dart';
import 'package:projeto_nw/view/ui/widgets/widget_card_evento.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/util/color/app_colors.dart';

class EventosPage extends StatefulWidget {


  @override
  State<EventosPage> createState() => _EventosPageState();
}


class _EventosPageState extends State<EventosPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listarEventos();
  }

  List<Evento> _listaDeEventos = [];

  Future<void> listarEventos() async{
    print('[LOG] LISTANDO TODOS OS EVENTOS');
    final List<Evento> listaDeEventos =
    await EventoRepository.instance.retornarTodos();
    setState((){
      _listaDeEventos = listaDeEventos;

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:  LogoNewWine(),
        ),
        body: Scaffold(
          backgroundColor: AppColors.backgroundDark,
          body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ListView(
              children: [
                SizedBox(height: 50,),
                Flex(
                    direction: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: (){
                        _showOptionsDialog();
                      },
                      child: Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.backgroundDarkGreen
                        ),
                        child: Center(child: Text('O que temos para Hoje!', style: TextStyle(fontSize: 20, fontFamily: 'Varela'),)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 5,color: AppColors.backgroundDarkGreen,)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Eventos", style: TextStyle(fontSize: 15, fontFamily: 'Varela', color: AppColors.backgroundColor)),
                    ),
                    Expanded(child: Divider(thickness: 5,color: AppColors.backgroundDarkGreen,)),
                  ],
                ),
                SizedBox(height: 50,),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: AppColors.appBackgroundDark2,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: ListView.builder(
                      itemCount: _listaDeEventos.length,
                      itemBuilder: (context, index) {
                        final evento = _listaDeEventos[index];
                        return Dismissible(
                          key: Key(evento.id.toString()),
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
                            await EventoRepository.instance.deletarEvento(evento.id!);
                            setState(() {
                              print('[LOG] APAGANDO O MUSICA ID - ${evento.id}');
                              listarEventos();
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
                                  content: Text("Tem certeza que deseja excluir este Evento?",style: TextStyle(color: AppColors.backgroundColor)),
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
                          child: CardEvento(
                            evento: evento,
                            titulo: evento.titulo,
                            data: evento.data,
                            tipo: evento.tipo,
                          ),
                        );
                      }




                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future<void> _showOptionsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColorCard,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(height: 20,),
                SimpleDialogOption(
                  onPressed: ()async {
                    String tipo = 'Culto';
                    await Navigator.pushNamed(context, '/adicionarEvento',arguments: tipo);
                    Navigator.pop(context, tipo);
                    print(tipo);
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.backgroundDarkGreen
                    ),
                    child: Center(child: Text('Culto', style: TextStyle(fontSize: 20, fontFamily: 'Varela'),)),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () async{
                    String tipo = 'Show';
                    await Navigator.pushNamed(context, '/adicionarEvento', arguments: tipo);
                    Navigator.pop(context, 'opcao2');
                    print('opcao2');
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.backgroundDarkGreen
                    ),
                    child: Center(child: Text('Show', style: TextStyle(fontSize: 20, fontFamily: 'Varela'),)),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () async {
                    String tipo = 'Ensaio';
                    await Navigator.pushNamed(context, '/adicionar_ensaio', arguments: tipo);
                    Navigator.pop(context, 'opcao3');

                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.backgroundDarkGreen
                    ),
                    child: Center(child: Text('Ensaio', style: TextStyle(fontSize: 20, fontFamily: 'Varela'),)),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar',style: TextStyle(color: AppColors.backgroundColor),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}