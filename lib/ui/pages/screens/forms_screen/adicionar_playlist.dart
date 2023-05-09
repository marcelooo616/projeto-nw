import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:projeto_nw/data/repository/Repertorio_repository.dart';
import 'package:projeto_nw/data/repository/musica_repository.dart';
import 'package:projeto_nw/entities/musica.dart';
import 'package:projeto_nw/entities/repetorio.dart';
import 'package:projeto_nw/ui/widgets/widget_card_musica_primario.dart';
import 'package:projeto_nw/ui/widgets/widget_textField_customizavel.dart';
import 'package:projeto_nw/util/app_colors.dart';


class AdicionarRepertorio extends StatefulWidget {
  const AdicionarRepertorio({Key? key}) : super(key: key);

  @override
  State<AdicionarRepertorio> createState() => _AdicionarRepertorioState();
}

class _AdicionarRepertorioState extends State<AdicionarRepertorio> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<FormState>();

 //final TextEditingController _primeiraCorTema = TextEditingController();
 // final TextEditingController _segundaCorTema = TextEditingController();
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _playlist = TextEditingController();

  List<Musica?> _listaDeMusicas = [];
  List<String> musicasSelecionadas = [];
  List<String> repertorioMusicas = [];
  List<String> _itens = [ ];


  Color selectedPrimairaColor = Color(0xFF85FFBD);
  Color selectedSegundaColor = Color(0xFFFFFB7D);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buscarTodosAsMusicas();
  }

  Future<void> _buscarTodosAsMusicas() async {
    print('musicassss');
    final List<Musica> listaDeMusicas =
    await MusicaRepository.instance.listaTodasAsMusicas();
    setState(() {
      _listaDeMusicas = listaDeMusicas;
    });
  }
  //Map<String, dynamic>? linha;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text('Adicionar playlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: ListView(
          children: [
            Card(
              color: const Color(0xFF85FFBD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:  [
                      selectedPrimairaColor,
                      selectedSegundaColor

                    ],
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(text: 'Adicionar ', style: TextStyle(fontSize: 50, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
                        TextSpan(text: '\n playlist ', style: TextStyle(fontSize: 60, fontFamily: 'Lato', fontWeight: FontWeight.w900, color: AppColors.backgroundDark2)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Escolha primeira cor'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: selectedPrimairaColor,
                                      onColorChanged: (color) {
                                        setState(() {
                                          selectedPrimairaColor = color;
                                        });
                                      },
                                      showLabel: true,
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(''),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(Size(100, 100)),
                            backgroundColor: MaterialStateProperty.all<Color>(selectedPrimairaColor),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Escolha segunda cor'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: selectedSegundaColor,
                                      onColorChanged: (color) {
                                        setState(() {
                                          selectedSegundaColor = color;
                                        });
                                      },
                                      showLabel: true,
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(''),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(Size(100, 100)),
                            backgroundColor: MaterialStateProperty.all<Color>(selectedSegundaColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    TextFieldCustomizavel(
                      controller:  _titulo,
                      hintText: 'Titulo da minha playlist',
                      labelText: 'Título',
                      validatorText: 'Campo obrigatório',
                      prefixIcon: Icon(Icons.music_note, color: AppColors.backgroundDarkGreen),
                    ),
                    SizedBox(height: 50,),
                    TextFieldCustomizavel(
                      controller:  _descricao,
                      hintText: 'Descricao da minha playlist',
                      labelText: 'Descrição',
                      validatorText: 'Campo obrigatório',
                      prefixIcon: Icon(Icons.music_note, color: AppColors.backgroundDarkGreen),
                    ),
                    SizedBox(height: 50,),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.backgroundDarkGreen),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0), // Define o raio das bordas
                            ),
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15))
                      ),

                      onPressed: () async {
                        _abrirModalSemArgumento();
                       /* Repertorio play = Repertorio(
                          id: 1,
                          titulo:_titulo.text ,
                          descricao: _descricao.text,
                          primeiraCorTema:selectedPrimairaColor.value.toRadixString(16),
                          segundaCorTema: selectedSegundaColor.value.toRadixString(16),
                          playlist: musicasSelecionadas,
                        );*/

                       // print('sassssss${play.toMap()}');
                        print('[LOG] - ADICIONANDO PLAYLIST a ${musicasSelecionadas as String}');


                      },
                      child: Text('Selecionar Musicas', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 50,),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.backgroundDarkGreen),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0), // Define o raio das bordas
                            ),
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15))
                      ),


                      onPressed: () async {
                      /*  Repertorio play = Repertorio(
                          id: 1,
                          titulo:_titulo.text ,
                          descricao: _descricao.text,
                          primeiraCorTema:selectedPrimairaColor.value.toRadixString(16),
                          segundaCorTema: selectedSegundaColor.value.toRadixString(16),
                          playlist: musicasSelecionadas,
                        );*/

                       // print(play.toMap());

                        if (_formKey.currentState!.validate())  {
                          // Cria um objeto Ensaio a partir dos dados preenchidos
                          String playlistJson = jsonEncode(musicasSelecionadas);
                          List<String> numerosString = musicasSelecionadas.map((numero) => numero.toString()).toList();
                          String musicasSelecionadasStr = musicasSelecionadas.join(',');


                          final playlist = Repertorio(
                            titulo:_titulo.text ,
                            descricao: _descricao.text,
                            primeiraCorTema:selectedPrimairaColor.value.toRadixString(16),
                            segundaCorTema: selectedSegundaColor.value.toRadixString(16),
                            playlist: musicasSelecionadasStr,
                          );
                         // print('[LOG] - ADICIONANDO PLAYLIST a ${musicasSelecionadas as String}');
                          // Adiciona o ensaio ao banco de dados
                          await RepertorioRepository.instance.adicionarPlaylist(playlist);
                          print('[LOG] - ADICIONANDO PLAYLIST');

                          // Fecha a tela e retorna para a tela anterior
                          Navigator.of(context).pop();
                        }
                        Navigator.of(context).pop();// verifique se esse valor é nulo

                      },
                      child: Text('Adicionar Playlist', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

  void _abrirModalSemArgumento() {
    _abrirModalSelecao(context);
  }

  void _abrirModalSelecao(BuildContext context) {
    List<String> _itensSelecionados = [];
     _itens = _listaDeMusicas.map((musica) => musica!.id!.toString()).toList();


    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Selecione os itens:'),
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _itens.length,
                  itemBuilder: (context, index) {
                    final item = _itens[index];
                    final items = _listaDeMusicas[index];
                    return CheckboxListTile(
                      title: Text(items!.titulo!),
                      value: _itensSelecionados.contains(item),
                      onChanged: (bool? selecionado) {
                        setState(() {
                          if (selecionado != null && selecionado) {
                            _itensSelecionados.add(item);
                          } else {
                            _itensSelecionados.remove(item);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                child: Text('Confirmar'),
                onPressed: () {
                  // Faça o que precisa com a lista de itens selecionados
                  musicasSelecionadas = _itensSelecionados ;
                  print(_itensSelecionados);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }


/*void _abrirModalMusic(BuildContext context) {
    List<String> _repert = [];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _listaDeMusicas.length,
          itemBuilder: (context, index) {
            final musica = _listaDeMusicas[index];
            return Container(
              child: CheckboxListTile(
                contentPadding: EdgeInsets.all(20),
                checkColor: AppColors.accentColor,
                title: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backgroundDark2,
                        ),
                        child: ListTile(
                          title: Text(
                            musica!.titulo!,
                            style: TextStyle(
                              color: AppColors.backgroundColor,
                            ),
                          ),
                          subtitle: Text(
                            musica!.autor!,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          leading: Card(
                            color: const Color(0xFF85FFBD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 4,
                            child: Container(
                              width: 75,
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    selectedPrimairaColor,
                                    selectedSegundaColor
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 1,
                                  left: 8,
                                  right: 0,
                                ),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'PLAY',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Divider(
                                          color: AppColors.backgroundDark,
                                          thickness: 2,
                                          indent: 10,
                                          endIndent: 40,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '\n LIST ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                value: musicasSelecionadas.contains(musica!.id!),
                onChanged: (checked) {
                  setState(() {
                    if (checked != null) {
                      musicasSelecionadas.add(musica!.id!.toString());
                    } else {
                      musicasSelecionadas.remove(musica!.id!);
                    }
                    _repert = List<String>.from(musicasSelecionadas);
                  });
                },
              ),
            );
          },
        );
      },
    );
    setState(() {
      _repert.addAll(musicasSelecionadas);
    });
  }*/

}
