import 'package:flutter/material.dart';
import 'package:projeto_nw/data/repository/cantor_repository.dart';
import 'package:projeto_nw/entities/cantor.dart';



class AdicionarCantorPage extends StatefulWidget {
  @override
  _AdicionarCantorPageState createState() => _AdicionarCantorPageState();
}

class _AdicionarCantorPageState extends State<AdicionarCantorPage> {
  final CantorRepository _cantorRepository = CantorRepository.instance;

  final _formKey = GlobalKey<FormState>();

  String? _nome;
  String? _idade;
  String? _tomCanto;
  String? _classificacaoVocal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cantor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nome = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Idade',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a idade do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _idade = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tom de Canto',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o tom de canto do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _tomCanto = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Classificação Vocal',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a classificação vocal do cantor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _classificacaoVocal = value;
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _salvarCantor,
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _salvarCantor() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      final Cantor cantor = Cantor(
        nome: _nome,
        idade: _idade,
        tomCanto: _tomCanto,
        classificacaoVocal: _classificacaoVocal,
      );
      await _cantorRepository.adicionarCantor(cantor);
      Navigator.of(context).pop();
    }
  }
}
