import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../services/test_notifier.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesAsync = ref.watch(countriesProvider);

    final onRefresh = useCallback(() {
      return ref.read(countriesProvider.notifier).refresh();
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Center(
          child: countriesAsync.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading data',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onRefresh,
                  child: const Text('Retry'),
                ),
              ],
            ),
            data: (countries) {
              if (countries.isEmpty) {
                return const Center(
                  child: Text('No countries found'),
                );
              }

              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(country.toString()),
                      onTap: () {
                        context.goNamed('details', pathParameters: {'id': index.toString()});
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
