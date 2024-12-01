import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../models/models.dart';
import '../services/auth_notifier.dart';
import '../services/notes_notifier.dart';

class StatsCard {
  final String name;
  final String stat;
  final String change;
  final bool isIncrease;

  StatsCard({
    required this.name,
    required this.stat,
    required this.change,
    required this.isIncrease,
  });
}

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(notesNotifierProvider);
    final authNotifier = ref.watch(authProvider.notifier);
    final noteController = useTextEditingController();
    final editingNoteId = useState<int?>(null);

    final stats = [
      StatsCard(
        name: 'Total Projects',
        stat: '12',
        change: '+2.5%',
        isIncrease: true,
      ),
      StatsCard(
        name: 'Active Tasks',
        stat: '24',
        change: '+4.1%',
        isIncrease: true,
      ),
      StatsCard(
        name: 'Completion Rate',
        stat: '98.5%',
        change: '+1.2%',
        isIncrease: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          TextButton(onPressed: authNotifier.signOut, child: const Text("Logout")),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats Cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  final stat = stats[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stat.name,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            stat.stat,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: stat.isIncrease ? Colors.green[100] : Colors.red[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              stat.change,
                              style: TextStyle(
                                color: stat.isIncrease ? Colors.green[800] : Colors.red[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // Notes Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notes',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),

                      // Add Note Form
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: noteController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your note...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () async {
                              if (noteController.text.isNotEmpty) {
                                try {
                                  final note = NoteCreate(text: noteController.text);
                                  await ref.read(notesNotifierProvider.notifier).addNote(note);
                                  noteController.clear();
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error adding note: $e')),
                                  );
                                }
                              }
                            },
                            child: const Text('Add Note'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Notes List
                      notesAsync.when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, stack) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error_outline, color: Colors.red, size: 48),
                              const SizedBox(height: 16),
                              Text('Error: ${error.toString()}'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  ref.invalidate(notesNotifierProvider);
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                        data: (notes) => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            final note = notes[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                onTap: () {
                                  context.goNamed('details', pathParameters: {'id': note.id.toString()});
                                },
                                title: editingNoteId.value == note.id
                                    ? TextField(
                                        controller: noteController,
                                        autofocus: true,
                                        onSubmitted: (value) async {
                                          if (value.isNotEmpty) {
                                            try {
                                              final updatedNote = note.copyWith(text: value);
                                              await ref.read(notesNotifierProvider.notifier).updateNote(updatedNote);
                                            } catch (e) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Error updating note: $e')),
                                              );
                                            }
                                          }
                                          editingNoteId.value = null;
                                          noteController.clear();
                                        },
                                      )
                                    : Text(note.text),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        if (editingNoteId.value == note.id) {
                                          editingNoteId.value = null;
                                          noteController.clear();
                                        } else {
                                          editingNoteId.value = note.id;
                                          noteController.text = note.text;
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        try {
                                          await ref.read(notesNotifierProvider.notifier).deleteNote(note.id);
                                        } catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Error deleting note: $e')),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
