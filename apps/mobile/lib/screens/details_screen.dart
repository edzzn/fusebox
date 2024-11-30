import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.goNamed('home'),
        ),
        title: Text('Details #$id'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Details for item $id'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.goNamed('home'),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
