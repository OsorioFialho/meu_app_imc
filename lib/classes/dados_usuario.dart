import 'dart:convert';
import 'dart:io';
import 'package:meu_app_imc/classes/calculo_imc.dart';

class DadosUsuario {
  String _nome = '';
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;
  String _imcClassificacao = '';

  String get nome => _nome;
  set nome(String value) => _nome = value;

  double get peso => _peso;
  set peso(double value) => _peso = value;

  double get altura => _altura;
  set altura(double value) => _altura = value;

  double get imc => _imc;
  set imc(double value) => _imc = value;

  String get imcClassificacao => _imcClassificacao;
  set imcClassificacao(String value) => _imcClassificacao = value;

  // Método para ler os dados do terminal
  void lerDados() {
    stdout.write('Informe o nome do usuário: ');
    _nome = stdin.readLineSync(encoding: utf8) ?? '';
    if (_nome.trim() == "") {
      throw Exception('Nome Inválido');
    }

    stdout.write('Informe o peso (em kg): ');
    String pesoStr = stdin.readLineSync(encoding: utf8) ?? '';
    _peso = double.tryParse(pesoStr) ?? 0.0;
    if (_peso == 0.0 || _peso > 600) {
      throw Exception('Peso Inválido');
    }

    stdout.write('Informe a altura (em metros): ');
    String alturaStr = stdin.readLineSync(encoding: utf8) ?? '';
    _altura = double.tryParse(alturaStr) ?? 0.0;
    if (_altura < 0.2 || _altura > 3) {
      throw Exception(
          'Altura Inválido: Tente usar o ponto para separar os metros dos centimetros');
    }

    //Chamando a classe calculo e obtendo valores e classificações
    var calculoObjeto = CalculoIMC();
    _imc = calculoObjeto.returnIMC(this);
    _imcClassificacao = calculoObjeto.returnClassificacao(_imc);
  }

  // Método para exibir os dados lidos e calculados
  void exibirDados() {
    print('Nome do usuário: $_nome');
    print('Peso: $_peso kg');
    print('Altura: $_altura metros');
    print('Seu IMC: $_imc');
    print('Sua classificação é: $_imcClassificacao');
  }
}
