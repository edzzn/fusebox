import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/models.dart';

part 'notes_notifier.g.dart';

@riverpod
class NotesNotifier extends _$NotesNotifier {
  SupabaseClient get _client => Supabase.instance.client;

  @override
  FutureOr<List<Note>> build() async {
    final response = await _client.from('notes').select().order('created_at');

    return response.map((note) => Note.fromJson(note)).toList();
  }

  Future<void> addNote(NoteCreate note) async {
    try {
      final userID = _client.auth.currentUser?.id;
      if (userID == null) {
        throw Exception('User must be authenticated to add notes');
      }

      final response = await _client.from('notes').insert(note.toJson()).select().select().single();

      final newNote = Note.fromJson(response);

      state = AsyncValue.data([newNote, ...state.value ?? []]);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      await _client.from('notes').update(note.toJson()).eq('id', note.id);
      ref.invalidateSelf();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await _client.from('notes').delete().eq('id', id);
      ref.invalidateSelf();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
