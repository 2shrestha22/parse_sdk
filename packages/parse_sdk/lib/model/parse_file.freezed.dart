// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'parse_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParseFile _$ParseFileFromJson(Map<String, dynamic> json) {
  return _ParseFile.fromJson(json);
}

/// @nodoc
class _$ParseFileTearOff {
  const _$ParseFileTearOff();

  _ParseFile call({required String name, required String url}) {
    return _ParseFile(
      name: name,
      url: url,
    );
  }

  ParseFile fromJson(Map<String, Object?> json) {
    return ParseFile.fromJson(json);
  }
}

/// @nodoc
const $ParseFile = _$ParseFileTearOff();

/// @nodoc
mixin _$ParseFile {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParseFileCopyWith<ParseFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParseFileCopyWith<$Res> {
  factory $ParseFileCopyWith(ParseFile value, $Res Function(ParseFile) then) =
      _$ParseFileCopyWithImpl<$Res>;
  $Res call({String name, String url});
}

/// @nodoc
class _$ParseFileCopyWithImpl<$Res> implements $ParseFileCopyWith<$Res> {
  _$ParseFileCopyWithImpl(this._value, this._then);

  final ParseFile _value;
  // ignore: unused_field
  final $Res Function(ParseFile) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ParseFileCopyWith<$Res> implements $ParseFileCopyWith<$Res> {
  factory _$ParseFileCopyWith(
          _ParseFile value, $Res Function(_ParseFile) then) =
      __$ParseFileCopyWithImpl<$Res>;
  @override
  $Res call({String name, String url});
}

/// @nodoc
class __$ParseFileCopyWithImpl<$Res> extends _$ParseFileCopyWithImpl<$Res>
    implements _$ParseFileCopyWith<$Res> {
  __$ParseFileCopyWithImpl(_ParseFile _value, $Res Function(_ParseFile) _then)
      : super(_value, (v) => _then(v as _ParseFile));

  @override
  _ParseFile get _value => super._value as _ParseFile;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_ParseFile(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParseFile extends _ParseFile {
  _$_ParseFile({required this.name, required this.url}) : super._();

  factory _$_ParseFile.fromJson(Map<String, dynamic> json) =>
      _$$_ParseFileFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'ParseFile(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParseFile &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  _$ParseFileCopyWith<_ParseFile> get copyWith =>
      __$ParseFileCopyWithImpl<_ParseFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParseFileToJson(this);
  }
}

abstract class _ParseFile extends ParseFile {
  factory _ParseFile({required String name, required String url}) =
      _$_ParseFile;
  _ParseFile._() : super._();

  factory _ParseFile.fromJson(Map<String, dynamic> json) =
      _$_ParseFile.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$ParseFileCopyWith<_ParseFile> get copyWith =>
      throw _privateConstructorUsedError;
}
