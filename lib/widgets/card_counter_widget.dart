import 'package:flutter/material.dart';

class CardCounter extends StatelessWidget {
  final ValueNotifier<int> counter;
  const CardCounter({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Contador'),
          ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, int counter, _) => Text(
              counter.toString(),
              style: const TextStyle(fontSize: 45),
            ),
          )
        ],
      ),
    );
  }
}
