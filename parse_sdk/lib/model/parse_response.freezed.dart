// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'parse_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataClass _$DataClassFromJson(Map<String, dynamic> json) {
  return _DataClass.fromJson(json);
}

/// @nodoc
class _$DataClassTearOff {
  const _$DataClassTearOff();

  _DataClass call({required String name}) {
    return _DataClass(
      name: name,
    );
  }

  DataClass fromJson(Map<String, Object?> json) {
    return DataClass.fromJson(json);
  }
}

/// @nodoc
const $DataClass = _$DataClassTearOff();

/// @nodoc
mixin _$DataClass {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataClassCopyWith<DataClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataClassCopyWith<$Res> {
  factory $DataClassCopyWith(DataClass value, $Res Function(DataClass) then) =
      _$DataClassCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$DataClassCopyWithImpl<$Res> implements $DataClassCopyWith<$Res> {
  _$DataClassCopyWithImpl(this._value, this._then);

  final DataClass _value;
  // ignore: unused_field
  final $Res Function(DataClass) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DataClassCopyWith<$Res> implements $DataClassCopyWith<$Res> {
  factory _$DataClassCopyWith(
          _DataClass value, $Res Function(_DataClass) then) =
      __$DataClassCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$DataClassCopyWithImpl<$Res> extends _$DataClassCopyWithImpl<$Res>
    implements _$DataClassCopyWith<$Res> {
  __$DataClassCopyWithImpl(_DataClass _value, $Res Function(_DataClass) _then)
      : super(_value, (v) => _then(v as _DataClass));

  @override
  _DataClass get _value => super._value as _DataClass;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_DataClass(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataClass extends _DataClass {
  const _$_DataClass({required this.name}) : super._();

  factory _$_DataClass.fromJson(Map<String, dynamic> json) =>
      _$$_DataClassFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'DataClass(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataClass &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  _$DataClassCopyWith<_DataClass> get copyWith =>
      __$DataClassCopyWithImpl<_DataClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataClassToJson(this);
  }
}

abstract class _DataClass extends DataClass {
  const factory _DataClass({required String name}) = _$_DataClass;
  const _DataClass._() : super._();

  factory _DataClass.fromJson(Map<String, dynamic> json) =
      _$_DataClass.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$DataClassCopyWith<_DataClass> get copyWith =>
      throw _privateConstructorUsedError;
}
