import 'package:meu_app_imc/classes/dados_usuario.dart';
import 'package:test/test.dart';
import 'package:meu_app_imc/classes/calculo_imc.dart';

void main() {
  group('CalculoIMC', () {
    test('returnIMC() deve calcular o IMC corretamente', () {
      final calculoIMC = CalculoIMC();
      final dadosUsuario = DadosUsuario();

      dadosUsuario.peso = 75.0;
      dadosUsuario.altura = 1.75;

      expect(calculoIMC.returnIMC(dadosUsuario), 24.49);
    });

    test('returnClassificacao() deve retornar a classificação correta', () {
      final calculoIMC = CalculoIMC();

      expect(calculoIMC.returnClassificacao(15.0), 'Magreza Grave');
      expect(calculoIMC.returnClassificacao(16.5), 'Magreza Moderada');
      expect(calculoIMC.returnClassificacao(18.0), 'Magreza Leve');
      expect(calculoIMC.returnClassificacao(22.0), 'Saudável');
      expect(calculoIMC.returnClassificacao(27.5), 'Sobrepeso');
      expect(calculoIMC.returnClassificacao(33.0), 'Obesidade Grau I');
      expect(
          calculoIMC.returnClassificacao(38.0), 'Obesidade Grau II (severa)');
      expect(
          calculoIMC.returnClassificacao(42.0), 'Obesidade Grau III (mórbida)');
    });
  });
}
