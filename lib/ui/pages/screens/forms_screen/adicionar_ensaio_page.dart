import 'package:flutter/material.dart';
import 'package:projeto_nw/data/repository/cantor_repository.dart';
import 'package:projeto_nw/data/repository/ensaio_repository.dart';
import 'package:projeto_nw/data/repository/musica_repository.dart';
import 'package:projeto_nw/entities/cantor.dart';
import 'package:projeto_nw/entities/ensaio.dart';
import 'package:projeto_nw/entities/musica.dart';
import 'package:projeto_nw/ui/widgets/widget_textField_customizavel.dart';
import 'package:projeto_nw/util/app_colors.dart';


class AdicionarEnsaioScreen extends StatefulWidget {
  @override
  _AdicionarEnsaioScreenState createState() => _AdicionarEnsaioScreenState();
}

class _AdicionarEnsaioScreenState extends State<AdicionarEnsaioScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores dos campos de texto

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();
  final TextEditingController _participantesController = TextEditingController(text: 'Participantes');
  final TextEditingController _participantesIdController = TextEditingController();
  final TextEditingController _repertorioController = TextEditingController(text: 'Repertorio');

  List<Cantor?> _cantores = [];
  List<Musica?> _musicas = [];
  List<String> novosParticipantes = [];
  List<String> selectedParticipants = [];
  List<int> selectedMusica = [];

  List<int> repertorioMusicas = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buscarTodosOsCantores();
    _buscarTodosAsMusicas();
  }

  Future<void> _buscarTodosOsCantores() async {
    final List<Cantor> listaDeCantores =
    await CantorRepository.instance.buscarTodosOsCantores();
    setState(() {
      _cantores = listaDeCantores;
    });
  }

  Future<void> _buscarTodosAsMusicas() async {
    print('musicassss');
    final List<Musica> listaDeMusicas =
    await MusicaRepository.instance.listaTodasAsMusicas();
    setState(() {
      _musicas = listaDeMusicas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text('Adicionar Ensaio'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  TextFieldCustomizavel(
                    controller:  _tituloController,
                    hintText: 'Titulo do ensaio',
                    labelText: 'Título',
                    validatorText: 'Campo obrigatório',
                    prefixIcon: Icon(Icons.music_note, color: AppColors.backgroundDarkGreen),
                  ),
                  SizedBox(height: 50,),
                  TextFieldCustomizavel(
                    controller:  _dataController,
                    hintText: 'Data do ensaio',
                    labelText: 'Data',
                    validatorText: 'Campo obrigatório',
                    prefixIcon: Icon(Icons.music_note, color: AppColors.backgroundDarkGreen),
                  ),
                  SizedBox(height: 50,),
                  TextFieldCustomizavel(
                    controller:  _horarioController,
                    hintText: 'Horario do ensaio',
                    labelText: 'Horário',
                    validatorText: 'Campo obrigatório',
                    prefixIcon: Icon(Icons.music_note, color: AppColors.backgroundDarkGreen),
                  ),
                  SizedBox(height: 50,),
                  TextFieldCustomizavel(
                    modal: _abrirModalSemArgumento,
                    controller:  _participantesController,
                    hintText: 'Participantes do ensaio',
                    labelText: 'Participantes',
                    validatorText: 'Campo obrigatório',
                    prefixIcon: Icon(Icons.music_note, color: AppColors.backgroundDarkGreen),
                  ),
                  SizedBox(height: 50,),
                  TextFieldCustomizavel(
                    modal: _abrirModalSemArgumentoMusic,
                    controller:  _repertorioController,
                    hintText: 'Repertório do ensaio',
                    labelText: 'Repertório',
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
                      if (_formKey.currentState!.validate())  {
                        List<String> numerosString = selectedMusica.map((numero) => numero.toString()).toList();
                        // Cria um objeto Ensaio a partir dos dados preenchidos
                        final ensaio = Ensaio(
                          titulo: _tituloController.text,
                          data: _dataController.text,
                          horario: _horarioController.text,
                          participantes: selectedParticipants,
                          repertorio: numerosString,
                        );

                        // Adiciona o ensaio ao banco de dados
                        await EnsaioDatabase.instance.adicionarEnsaio(ensaio);
                        MusicaRepository.instance.atualizarContadores(selectedMusica);

                        // Fecha a tela e retorna para a tela anterior
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Adicionar Ensaio', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _abrirModalSemArgumento() {
    _abrirModal(context);
  }
  void _abrirModalSemArgumentoMusic() {
    _abrirModalMusic(context);
  }

  void _abrirModal(BuildContext context) {
    List<String> _participantes = [];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _cantores.length,
          itemBuilder: (context, index) {
            final cantor = _cantores[index];
            return CheckboxListTile(
              title: Text(cantor!.nome!),
              value: selectedParticipants.contains(cantor!.id!),
              onChanged: (checked) {
                setState(() {
                  if (checked != null) {
                    selectedParticipants.add(cantor!.id.toString()!);
                  } else {
                    selectedParticipants.remove(cantor!.id.toString()!); // <- Correção aqui
                  }
                });
              },
            );
          },
        );
      },
    );
    setState(() {
      _participantes.addAll(novosParticipantes);
    });
  }
  void _abrirModalMusic(BuildContext context) {
    List<int> _repert = [];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _musicas.length,
          itemBuilder: (context, index) {
            final musica = _musicas[index];
            return CheckboxListTile(
              title: Text(musica!.titulo!),
              value: selectedParticipants.contains(musica!.id!),
              onChanged: (checked) {
                setState(() {
                  if (checked != null) {
                    selectedMusica.add(musica!.id!);
                  } else {
                    selectedMusica.remove(musica!.id!); // <- Correção aqui
                  }
                });
              },
            );
          },
        );
      },
    );
    setState(() {
      _repert.addAll(repertorioMusicas);
    });
  }
}
