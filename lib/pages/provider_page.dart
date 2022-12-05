import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) => 0);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Practice'),
      ),
      body: Center(
          child: Text(
        'Count: ${ref.watch(valueProvider)}',
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
