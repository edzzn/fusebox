import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'test_notifier.g.dart';

@riverpod
class Countries extends _$Countries {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    state = const AsyncValue.loading();
    try {
      final response = await Supabase.instance.client.from('test').select().limit(5);
      return List<Map<String, dynamic>>.from(response);
    } catch (e, stack) {
      throw AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final response = await Supabase.instance.client.from('test').select().limit(5);
      return List<Map<String, dynamic>>.from(response);
    });
  }
}
