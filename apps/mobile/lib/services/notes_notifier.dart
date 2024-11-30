import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'notes_notifier.g.dart';

class Note {
  final String id;
  final String text;

  Note({required this.id, required this.text});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'].toString(),
      text: json['note'] as String,
    );
  }
}

class NoteWithUser extends Note {
  final String userID;

  NoteWithUser({required super.id, required super.text, required this.userID});
}

@riverpod
class NotesNotifier extends _$NotesNotifier {
  SupabaseClient get _client => Supabase.instance.client;

  @override
  FutureOr<List<Note>> build() async {
    final response = await _client.from('notes').select('id,note').order('id');
    return response.map((note) => Note.fromJson(note)).toList();
  }

  Future<void> addNote(String text) async {
    try {
      final userID = _client.auth.currentUser?.id;
      if (userID == null) {
        throw Exception('User must be authenticated to add notes');
      }

      await _client.from('notes').insert({
        'note': text,
      });

      final newNote = Note(id: '', text: text);

      state = AsyncValue.data([...state.value ?? [], newNote]);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> updateNote(String id, String text) async {
    try {
      await _client.from('notes').update({'note': text}).eq('id', id);
      ref.invalidateSelf();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await _client.from('notes').delete().eq('id', id);
      ref.invalidateSelf();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
