import 'package:meu_app_imc/classes/dados_usuario.dart';

class CalculoIMC {
  double returnIMC(DadosUsuario dadosUsuario) {
    var imc = dadosUsuario.peso / (dadosUsuario.altura * dadosUsuario.altura);
    double imcTruncado = double.parse(imc.toStringAsFixed(2));
    return imcTruncado;
  }

  String returnClassificacao(double imc) {
    if (imc < 16) {
      return 'Magreza Grave';
    } else if (imc < 17) {
      return 'Magreza Moderada';
    } else if (imc < 18.5) {
      return 'Magreza Leve';
    } else if (imc < 25) {
      return 'Saudável';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else if (imc < 35) {
      return 'Obesidade Grau I';
    } else if (imc < 40) {
      return 'Obesidade Grau II (severa)';
    } else {
      return 'Obesidade Grau III (mórbida)';
    }
  }
}
