// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SharedModelsImpl _$$SharedModelsImplFromJson(Map<String, dynamic> json) =>
    _$SharedModelsImpl(
      note: Note.fromJson(json['note'] as Map<String, dynamic>),
      noteCreate:
          NoteCreate.fromJson(json['noteCreate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SharedModelsImplToJson(_$SharedModelsImpl instance) =>
    <String, dynamic>{
      'note': instance.note,
      'noteCreate': instance.noteCreate,
    };

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

_$NoteCreateImpl _$$NoteCreateImplFromJson(Map<String, dynamic> json) =>
    _$NoteCreateImpl(
      text: json['text'] as String,
    );

Map<String, dynamic> _$$NoteCreateImplToJson(_$NoteCreateImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
