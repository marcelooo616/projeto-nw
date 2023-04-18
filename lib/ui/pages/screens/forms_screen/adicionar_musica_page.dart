import 'package:flutter/material.dart';
import 'package:projeto_nw/data/repository/cantor_repository.dart';
import 'package:projeto_nw/data/repository/musica_repository.dart';
import 'package:projeto_nw/entities/cantor.dart';
import 'package:projeto_nw/entities/musica.dart';
import 'package:projeto_nw/util/app_colors.dart';

class AdicionarMusicaScreen extends StatefulWidget {
  @override
  _AdicionarMusicaScreenState createState() => _AdicionarMusicaScreenState();
}

class _AdicionarMusicaScreenState extends State<AdicionarMusicaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _autorController = TextEditingController();
  final _tomController = TextEditingController();
  final _cantorController = TextEditingController();
  final _nomeCantorController = TextEditingController();

  Future<void> _adicionarMusica() async {
    final titulo = _tituloController.text;
    final autor = _autorController.text;
    final tom = _tomController.text;
    final idCantorSolo = _cantorController.text;

    if (titulo.isEmpty || autor.isEmpty || tom.isEmpty) {
      return;
    }

    final musica = Musica(
      titulo: titulo,
      autor: autor,
      tom: tom,
      idCantorSolo: int.parse(idCantorSolo),
    );

    await MusicaRepository.instance.adicionarMusica(musica);
    print('[LOG MUSICA]${musica.toMap()}');

    Navigator.pop(context);
  }

  List<Cantor?> _cantores = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buscarTodosOsCantores();
  }

  Future<void> _buscarTodosOsCantores() async {
    final List<Cantor> listaDeCantores =
        await CantorRepository.instance.buscarTodosOsCantores();
    setState(() {
      _cantores = listaDeCantores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text('Adicionar Música'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundDark2,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: _tituloController,
                      decoration: InputDecoration(
                          hintText: 'Nome da musica',
                          hintStyle: TextStyle(color: AppColors.backgroundDarkGreen.withOpacity(0.1)),
                          prefixIcon: Icon(Icons.title, color: AppColors.backgroundDarkGreen),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                          // Define o padding com altura da label ajustada

                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          floatingLabelStyle: TextStyle(
                              color: AppColors.backgroundDarkGreen
                                  .withOpacity(0.3)),
                          // contentPadding: EdgeInsets.only(left: 20),
                          labelText: 'Título',
                          labelStyle:
                              TextStyle(color: AppColors.backgroundDarkGreen)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O título é obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundDark2,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _autorController,
                      decoration: InputDecoration(
                          hintText: 'Autor da musica',
                          hintStyle: TextStyle(color: AppColors.backgroundDarkGreen.withOpacity(0.1)),
                          prefixIcon: Icon(Icons.person, color: AppColors.backgroundDarkGreen),
                          floatingLabelStyle: TextStyle(
                              color: AppColors.backgroundDarkGreen
                                  .withOpacity(0.3)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                          // Define o padding com altura da label ajustada

                          labelText: 'Autor',
                          labelStyle:
                              TextStyle(color: AppColors.backgroundDarkGreen)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O autor é obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundDark2,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _tomController,
                      decoration: InputDecoration(
                          hintText: 'Tom da musica',
                          hintStyle: TextStyle(color: AppColors.backgroundDarkGreen.withOpacity(0.1)),
                        prefixIcon: Icon(Icons.music_note, color: AppColors.backgroundDarkGreen),
                          floatingLabelStyle: TextStyle(
                              color: AppColors.backgroundDarkGreen
                                  .withOpacity(0.3)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                          // Define o padding com altura da label ajustada

                          labelText: 'Tom',
                          labelStyle:
                              TextStyle(color: AppColors.backgroundDarkGreen)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O tom é obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundDark2,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      onTap: () {
                        _abrirModal(context);
                      },
                      controller: _nomeCantorController,
                      decoration: InputDecoration(
                        hintText: 'Responsavel pelo solo',
                          hintStyle: TextStyle(color: AppColors.backgroundDarkGreen.withOpacity(0.1)),
                          prefixIcon: Icon(Icons.mic_external_on, color: AppColors.backgroundDarkGreen),
                          floatingLabelStyle: TextStyle(color: AppColors.backgroundDarkGreen.withOpacity(0.3)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                          labelText: 'Cantor',
                          labelStyle: TextStyle(color: AppColors.backgroundDarkGreen)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O Cantor é obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 100),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _adicionarMusica();
                      }
                    },
                    child: Text('Salvar', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _abrirModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // retorna o widget da modal
        return ListView.builder(
            itemCount: _cantores.length,
            itemBuilder: (context, index) {
              final cantor = _cantores[index];
              return ListTile(
                onTap: () {
                  setState(() {
                    _nomeCantorController.text = cantor!.nome!;
                    _cantorController.text = cantor!.id.toString();
                  });
                },
                title: Text(cantor!.nome!),
                subtitle: Text(cantor!.classificacaoVocal!),
                trailing: Text(cantor!.tomCanto!),
              );
            });
      },
    );
  }
}
