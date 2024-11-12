import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 10));
  return "Data fetched successfully";
}

final dataProvider = FutureProvider<String>((ref) => fetchData());

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('FutureProvider Example')),
      body: Center(
          child: data.when(
              data: (data) => Text(data),
              error: (error, stack) => Text("Error $error"),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
