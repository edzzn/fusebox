// To parse this JSON data, do
//
//     final sharedModels = sharedModelsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'shared_models.freezed.dart';
part 'shared_models.g.dart';

SharedModels sharedModelsFromJson(String str) => SharedModels.fromJson(json.decode(str));

String sharedModelsToJson(SharedModels data) => json.encode(data.toJson());

@freezed
class SharedModels with _$SharedModels {
  const factory SharedModels({
    @JsonKey(name: "note") required Note note,
    @JsonKey(name: "noteCreate") required NoteCreate noteCreate,
  }) = _SharedModels;

  factory SharedModels.fromJson(Map<String, dynamic> json) => _$SharedModelsFromJson(json);
}

@freezed
class Note with _$Note {
  const factory Note({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "text") required String text,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}

@freezed
class NoteCreate with _$NoteCreate {
  const factory NoteCreate({
    @JsonKey(name: "text") required String text,
  }) = _NoteCreate;

  factory NoteCreate.fromJson(Map<String, dynamic> json) => _$NoteCreateFromJson(json);
}
