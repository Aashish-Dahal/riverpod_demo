import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = StateProvider<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Practice'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Count: ${ref.watch(valueProvider)}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(valueProvider.notifier).state++;
                    },
                    child: const Text('Increment')),
                ElevatedButton(
                    onPressed: () {
                      ref.read(valueProvider.notifier).state--;
                    },
                    child: const Text('Decrement')),
              ],
            )
          ],
        ),
      )),
    );
  }
}
