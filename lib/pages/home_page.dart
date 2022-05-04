import 'package:flutter/material.dart';
import 'package:flutter_integration_test/controllers/home_controller.dart';
import 'package:flutter_integration_test/widgets/card_counter_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: _controller.title,
          builder: (context, String titulo, _) => Text(
            titulo,
            key: const Key('titulo'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: const Key('tituloInput'),
              initialValue: _controller.title.value,
              onChanged: (valor) => _controller.title.value = valor,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Titulo'),
              ),
            ),
            CardCounter(
              counter: _controller.counter,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.counter.value++,
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
