import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 2. StateProvider
// StateProvider is useful for managing mutable state in a simple way. It exposes a state variable that can be directly modified.

final counterProvider = StateProvider<int>((ref) => 0);

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider Example')),
      body: Center(child: Text('Counter: $counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Increment the counter using `ref.read`
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
