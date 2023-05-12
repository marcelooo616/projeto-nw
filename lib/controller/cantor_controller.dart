import 'package:flutter/material.dart';
import 'package:projeto_nw/models/data/repository/cantor_repository.dart';
import 'package:projeto_nw/models/entities/cantor.dart';


class CantorController {
  final GlobalKey<FormState> _formKey;
  final CantorRepository _cantorRepository;

  String _nome = '';
  String _idade = '';
  String _tomCanto = '';
  String _classificacaoVocal = '';

  CantorController(this._formKey, this._cantorRepository);

  void salvarCantor(BuildContext context) async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      final Cantor cantor = Cantor(
        nome: _nome,
        idade: _idade,
        tomCanto: _tomCanto,
        classificacaoVocal: _classificacaoVocal,
      );
      await _cantorRepository.adicionarItem(cantor);
      print(cantor.toMap());
      Navigator.of(context).pop();
    }
  }



  void setNome(String nome) {
    _nome = nome;
  }

  void setIdade(String idade) {
    _idade = idade;
  }

  void setTomCanto(String tomCanto) {
    _tomCanto = tomCanto;
  }

  void setClassificacaoVocal(String classificacaoVocal) {
    _classificacaoVocal = classificacaoVocal;
  }
}
