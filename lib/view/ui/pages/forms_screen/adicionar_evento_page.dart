import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/cantor_repository.dart';
import 'package:projeto_nw/models/data/repository/evento_repository.dart';
import 'package:projeto_nw/models/data/repository/musica_repository.dart';
import 'package:projeto_nw/models/entities/cantor.dart';
import 'package:projeto_nw/models/entities/evento.dart';
import 'package:projeto_nw/models/entities/musica.dart';
import 'package:projeto_nw/view/ui/widgets/widget_logo_marca.dart';
import 'package:projeto_nw/view/ui/widgets/widget_textField_customizavel.dart';
import 'package:projeto_nw/util/color/app_colors.dart';
import 'dart:convert';

class AdicionarEventoPage extends StatefulWidget {


  @override
  State<AdicionarEventoPage> createState() => _AdicionarEventoPageState();
}

class _AdicionarEventoPageState extends State<AdicionarEventoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _horario = TextEditingController();
  final TextEditingController _endereco = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buscarTodosOsCantores();
    _buscarTodosAsMusicas();
  }


  List<Cantor?> _cantores = [];
  List<Musica?> _listaDeMusicas = [];
  List<String> musicasSelecionadas = [];
  List<String> _itens = [];


  List<Musica?> _listaDeCantores = [];
  List<String> CantoresSelecionadas = [];
  List<String> _itensCantores = [];

  Future<void> _buscarTodosOsCantores() async {
    final List<Cantor> listaDeCantores =
    await CantorRepository.instance.retornarTodos();
    setState(() {
      _cantores = listaDeCantores;
    });
  }

  Future<void> _buscarTodosAsMusicas() async {
    print('musicassss');
    final List<Musica> listaDeMusicas =
    await MusicaRepository.instance.retornarTodos();
    setState(() {
      _listaDeMusicas = listaDeMusicas;
    });
  }


  @override
  Widget build(BuildContext context) {
    //Evento evento = ModalRoute.of(context)?.settings.arguments as Evento;
    String? argumento = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: LogoNewWine()),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView(
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.backgroundDarkGreen
                  ),
                  child: Center(child: Text('Partiu para mais um $argumento!', style: TextStyle(fontSize: 20, fontFamily: 'Varela'),)),
                )
              ],
            ),
            Form(
              key: _formKey,
              child: Flex(
                  direction: Axis.vertical,
              children: [
                //titulo
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextFieldCustomizavel(
                    controller: _titulo,
                    labelText: 'Titulo',
                    hintText: 'Titulo do evento',

                  ),
                ),

                //data
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextFieldCustomizavel(
                    controller: _data,
                    labelText: 'Data',
                    hintText: 'Data do evento',

                  ),
                ),
                //haorario
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextFieldCustomizavel(
                    controller: _horario,
                    labelText: 'Horario',
                    hintText: 'Horario do evento',

                  ),
                ),
                //endereco
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextFieldCustomizavel(
                    controller: _endereco,
                    labelText: 'Endereço',
                    hintText: 'Endereço do evento',

                  ),
                ),
                // selecionar musicas
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
                    _abrirModalSemArgumentoMenbros();
                    print('[LOG] - ADICIONANDO PLAYLIST a ${musicasSelecionadas as String}');
                  },
                  child: Text('Selecionar Cantores', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),),
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
                    if (_formKey.currentState!.validate())  {
                      // Cria um objeto Ensaio a partir dos dados preenchidos
                      String playlistJson = jsonEncode(musicasSelecionadas);
                      List<String> numerosString = musicasSelecionadas.map((numero) => numero.toString()).toList();
                      List<String> cantoresIdString = CantoresSelecionadas.map((numero) => numero.toString()).toList();
                      String musicasSelecionadasStr = musicasSelecionadas.join(',');
                      String cantoresSelecionadasStr = CantoresSelecionadas.join(',');


                     /* final playlist = Repertorio(
                        titulo:_titulo.text ,
                        descricao: _descricao.text,
                        primeiraCorTema:selectedPrimairaColor.value.toRadixString(16),
                        segundaCorTema: selectedSegundaColor.value.toRadixString(16),
                        playlist: musicasSelecionadasStr,
                      );*/

                      final evento = Evento(
                        titulo: _titulo.text,
                        data: _data.text,
                        horario: _horario.text,
                        endereco: _endereco.text,
                        tipo: argumento,
                        repertorio:  musicasSelecionadasStr,
                        participantes: cantoresSelecionadasStr
                      );

                      print('[LOG] - ADICIONANDO Evento ${evento.toMap()}}');
                      // print('[LOG] - ADICIONANDO PLAYLIST a ${musicasSelecionadas as String}');
                      // Adiciona o ensaio ao banco de dados
                      await EventoRepository.instance.adicionarEvento(evento);
                      print('[LOG] - ADICIONANDO Evento');
                      // Fecha a tela e retorna para a tela anterior
                      Navigator.of(context).pop();
                    }
                    // verifique se esse valor é nulo
                  },
                  child: Text('Adicionar Evento', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),),
                ),

              ],
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
  void _abrirModalSemArgumentoMenbros() {
    _abrirModalSelecaoMenbros(context);
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
  void _abrirModalSelecaoMenbros(BuildContext context) {
    List<String> _itensSelecionados = [];
    _itensCantores = _cantores.map((cantores) => cantores!.id!.toString()).toList();


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
                  itemCount: _itensCantores.length,
                  itemBuilder: (context, index) {
                    final item = _itensCantores[index];
                    final items = _cantores[index];
                    return CheckboxListTile(
                      title: Text(items!.nome!),
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
                  CantoresSelecionadas = _itensSelecionados ;
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




}
