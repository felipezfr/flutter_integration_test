import 'package:flutter_integration_test/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test HomeController', () {
    test('Contador deve inicializar em 0', () {
      expect(HomeController().counter.value, 0);
    });
    test('Incrementar o contador em 1 vez', () {
      final controller = HomeController();
      controller.counter.value++;
      expect(controller.counter.value, 1);
    });
    test('Titulo inicial deve ser Teste de integração', () {
      expect(HomeController().title.value, 'Teste de integração');
    });
    test('Alterar o titulo Teste de integração para Home Page', () {
      final controller = HomeController();
      controller.title.value = 'Home Page';
      expect(controller.title.value, 'Home Page');
    });
  });
}
