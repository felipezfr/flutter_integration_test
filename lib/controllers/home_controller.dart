import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);
  final ValueNotifier<String> title =
      ValueNotifier<String>("Teste de integração");
}
