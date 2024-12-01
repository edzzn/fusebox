// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SharedModels _$SharedModelsFromJson(Map<String, dynamic> json) {
  return _SharedModels.fromJson(json);
}

/// @nodoc
mixin _$SharedModels {
  @JsonKey(name: "note")
  Note get note => throw _privateConstructorUsedError;
  @JsonKey(name: "noteCreate")
  NoteCreate get noteCreate => throw _privateConstructorUsedError;

  /// Serializes this SharedModels to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SharedModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedModelsCopyWith<SharedModels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedModelsCopyWith<$Res> {
  factory $SharedModelsCopyWith(
          SharedModels value, $Res Function(SharedModels) then) =
      _$SharedModelsCopyWithImpl<$Res, SharedModels>;
  @useResult
  $Res call(
      {@JsonKey(name: "note") Note note,
      @JsonKey(name: "noteCreate") NoteCreate noteCreate});

  $NoteCopyWith<$Res> get note;
  $NoteCreateCopyWith<$Res> get noteCreate;
}

/// @nodoc
class _$SharedModelsCopyWithImpl<$Res, $Val extends SharedModels>
    implements $SharedModelsCopyWith<$Res> {
  _$SharedModelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? noteCreate = null,
  }) {
    return _then(_value.copyWith(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      noteCreate: null == noteCreate
          ? _value.noteCreate
          : noteCreate // ignore: cast_nullable_to_non_nullable
              as NoteCreate,
    ) as $Val);
  }

  /// Create a copy of SharedModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value) as $Val);
    });
  }

  /// Create a copy of SharedModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoteCreateCopyWith<$Res> get noteCreate {
    return $NoteCreateCopyWith<$Res>(_value.noteCreate, (value) {
      return _then(_value.copyWith(noteCreate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SharedModelsImplCopyWith<$Res>
    implements $SharedModelsCopyWith<$Res> {
  factory _$$SharedModelsImplCopyWith(
          _$SharedModelsImpl value, $Res Function(_$SharedModelsImpl) then) =
      __$$SharedModelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "note") Note note,
      @JsonKey(name: "noteCreate") NoteCreate noteCreate});

  @override
  $NoteCopyWith<$Res> get note;
  @override
  $NoteCreateCopyWith<$Res> get noteCreate;
}

/// @nodoc
class __$$SharedModelsImplCopyWithImpl<$Res>
    extends _$SharedModelsCopyWithImpl<$Res, _$SharedModelsImpl>
    implements _$$SharedModelsImplCopyWith<$Res> {
  __$$SharedModelsImplCopyWithImpl(
      _$SharedModelsImpl _value, $Res Function(_$SharedModelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SharedModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? noteCreate = null,
  }) {
    return _then(_$SharedModelsImpl(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      noteCreate: null == noteCreate
          ? _value.noteCreate
          : noteCreate // ignore: cast_nullable_to_non_nullable
              as NoteCreate,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedModelsImpl implements _SharedModels {
  const _$SharedModelsImpl(
      {@JsonKey(name: "note") required this.note,
      @JsonKey(name: "noteCreate") required this.noteCreate});

  factory _$SharedModelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedModelsImplFromJson(json);

  @override
  @JsonKey(name: "note")
  final Note note;
  @override
  @JsonKey(name: "noteCreate")
  final NoteCreate noteCreate;

  @override
  String toString() {
    return 'SharedModels(note: $note, noteCreate: $noteCreate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedModelsImpl &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.noteCreate, noteCreate) ||
                other.noteCreate == noteCreate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, note, noteCreate);

  /// Create a copy of SharedModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedModelsImplCopyWith<_$SharedModelsImpl> get copyWith =>
      __$$SharedModelsImplCopyWithImpl<_$SharedModelsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedModelsImplToJson(
      this,
    );
  }
}

abstract class _SharedModels implements SharedModels {
  const factory _SharedModels(
          {@JsonKey(name: "note") required final Note note,
          @JsonKey(name: "noteCreate") required final NoteCreate noteCreate}) =
      _$SharedModelsImpl;

  factory _SharedModels.fromJson(Map<String, dynamic> json) =
      _$SharedModelsImpl.fromJson;

  @override
  @JsonKey(name: "note")
  Note get note;
  @override
  @JsonKey(name: "noteCreate")
  NoteCreate get noteCreate;

  /// Create a copy of SharedModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedModelsImplCopyWith<_$SharedModelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Note _$NoteFromJson(Map<String, dynamic> json) {
  return _Note.fromJson(json);
}

/// @nodoc
mixin _$Note {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String get text => throw _privateConstructorUsedError;

  /// Serializes this Note to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call({@JsonKey(name: "id") int id, @JsonKey(name: "text") String text});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteImplCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$NoteImplCopyWith(
          _$NoteImpl value, $Res Function(_$NoteImpl) then) =
      __$$NoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "id") int id, @JsonKey(name: "text") String text});
}

/// @nodoc
class __$$NoteImplCopyWithImpl<$Res>
    extends _$NoteCopyWithImpl<$Res, _$NoteImpl>
    implements _$$NoteImplCopyWith<$Res> {
  __$$NoteImplCopyWithImpl(_$NoteImpl _value, $Res Function(_$NoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$NoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteImpl implements _Note {
  const _$NoteImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "text") required this.text});

  factory _$NoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "text")
  final String text;

  @override
  String toString() {
    return 'Note(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      __$$NoteImplCopyWithImpl<_$NoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteImplToJson(
      this,
    );
  }
}

abstract class _Note implements Note {
  const factory _Note(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "text") required final String text}) = _$NoteImpl;

  factory _Note.fromJson(Map<String, dynamic> json) = _$NoteImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "text")
  String get text;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoteCreate _$NoteCreateFromJson(Map<String, dynamic> json) {
  return _NoteCreate.fromJson(json);
}

/// @nodoc
mixin _$NoteCreate {
  @JsonKey(name: "text")
  String get text => throw _privateConstructorUsedError;

  /// Serializes this NoteCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoteCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteCreateCopyWith<NoteCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCreateCopyWith<$Res> {
  factory $NoteCreateCopyWith(
          NoteCreate value, $Res Function(NoteCreate) then) =
      _$NoteCreateCopyWithImpl<$Res, NoteCreate>;
  @useResult
  $Res call({@JsonKey(name: "text") String text});
}

/// @nodoc
class _$NoteCreateCopyWithImpl<$Res, $Val extends NoteCreate>
    implements $NoteCreateCopyWith<$Res> {
  _$NoteCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteCreateImplCopyWith<$Res>
    implements $NoteCreateCopyWith<$Res> {
  factory _$$NoteCreateImplCopyWith(
          _$NoteCreateImpl value, $Res Function(_$NoteCreateImpl) then) =
      __$$NoteCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "text") String text});
}

/// @nodoc
class __$$NoteCreateImplCopyWithImpl<$Res>
    extends _$NoteCreateCopyWithImpl<$Res, _$NoteCreateImpl>
    implements _$$NoteCreateImplCopyWith<$Res> {
  __$$NoteCreateImplCopyWithImpl(
      _$NoteCreateImpl _value, $Res Function(_$NoteCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoteCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$NoteCreateImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteCreateImpl implements _NoteCreate {
  const _$NoteCreateImpl({@JsonKey(name: "text") required this.text});

  factory _$NoteCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteCreateImplFromJson(json);

  @override
  @JsonKey(name: "text")
  final String text;

  @override
  String toString() {
    return 'NoteCreate(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteCreateImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of NoteCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteCreateImplCopyWith<_$NoteCreateImpl> get copyWith =>
      __$$NoteCreateImplCopyWithImpl<_$NoteCreateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteCreateImplToJson(
      this,
    );
  }
}

abstract class _NoteCreate implements NoteCreate {
  const factory _NoteCreate(
      {@JsonKey(name: "text") required final String text}) = _$NoteCreateImpl;

  factory _NoteCreate.fromJson(Map<String, dynamic> json) =
      _$NoteCreateImpl.fromJson;

  @override
  @JsonKey(name: "text")
  String get text;

  /// Create a copy of NoteCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteCreateImplCopyWith<_$NoteCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
