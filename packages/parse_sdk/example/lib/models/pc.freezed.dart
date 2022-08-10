// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PC _$PCFromJson(Map<String, dynamic> json) {
  return _PC.fromJson(json);
}

/// @nodoc
class _$PCTearOff {
  const _$PCTearOff();

  _PC call(
      {int? cpu,
      int? ram,
      int? disk,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String objectId}) {
    return _PC(
      cpu: cpu,
      ram: ram,
      disk: disk,
      createdAt: createdAt,
      updatedAt: updatedAt,
      objectId: objectId,
    );
  }

  PC fromJson(Map<String, Object?> json) {
    return PC.fromJson(json);
  }
}

/// @nodoc
const $PC = _$PCTearOff();

/// @nodoc
mixin _$PC {
  int? get cpu => throw _privateConstructorUsedError;
  int? get ram => throw _privateConstructorUsedError;
  int? get disk => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get objectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PCCopyWith<PC> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PCCopyWith<$Res> {
  factory $PCCopyWith(PC value, $Res Function(PC) then) =
      _$PCCopyWithImpl<$Res>;
  $Res call(
      {int? cpu,
      int? ram,
      int? disk,
      DateTime createdAt,
      DateTime updatedAt,
      String objectId});
}

/// @nodoc
class _$PCCopyWithImpl<$Res> implements $PCCopyWith<$Res> {
  _$PCCopyWithImpl(this._value, this._then);

  final PC _value;
  // ignore: unused_field
  final $Res Function(PC) _then;

  @override
  $Res call({
    Object? cpu = freezed,
    Object? ram = freezed,
    Object? disk = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? objectId = freezed,
  }) {
    return _then(_value.copyWith(
      cpu: cpu == freezed
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as int?,
      ram: ram == freezed
          ? _value.ram
          : ram // ignore: cast_nullable_to_non_nullable
              as int?,
      disk: disk == freezed
          ? _value.disk
          : disk // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      objectId: objectId == freezed
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PCCopyWith<$Res> implements $PCCopyWith<$Res> {
  factory _$PCCopyWith(_PC value, $Res Function(_PC) then) =
      __$PCCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? cpu,
      int? ram,
      int? disk,
      DateTime createdAt,
      DateTime updatedAt,
      String objectId});
}

/// @nodoc
class __$PCCopyWithImpl<$Res> extends _$PCCopyWithImpl<$Res>
    implements _$PCCopyWith<$Res> {
  __$PCCopyWithImpl(_PC _value, $Res Function(_PC) _then)
      : super(_value, (v) => _then(v as _PC));

  @override
  _PC get _value => super._value as _PC;

  @override
  $Res call({
    Object? cpu = freezed,
    Object? ram = freezed,
    Object? disk = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? objectId = freezed,
  }) {
    return _then(_PC(
      cpu: cpu == freezed
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as int?,
      ram: ram == freezed
          ? _value.ram
          : ram // ignore: cast_nullable_to_non_nullable
              as int?,
      disk: disk == freezed
          ? _value.disk
          : disk // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      objectId: objectId == freezed
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PC implements _PC {
  const _$_PC(
      {this.cpu,
      this.ram,
      this.disk,
      required this.createdAt,
      required this.updatedAt,
      required this.objectId});

  factory _$_PC.fromJson(Map<String, dynamic> json) => _$$_PCFromJson(json);

  @override
  final int? cpu;
  @override
  final int? ram;
  @override
  final int? disk;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String objectId;

  @override
  String toString() {
    return 'PC(cpu: $cpu, ram: $ram, disk: $disk, createdAt: $createdAt, updatedAt: $updatedAt, objectId: $objectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PC &&
            (identical(other.cpu, cpu) || other.cpu == cpu) &&
            (identical(other.ram, ram) || other.ram == ram) &&
            (identical(other.disk, disk) || other.disk == disk) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cpu, ram, disk, createdAt, updatedAt, objectId);

  @JsonKey(ignore: true)
  @override
  _$PCCopyWith<_PC> get copyWith => __$PCCopyWithImpl<_PC>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PCToJson(this);
  }
}

abstract class _PC implements PC {
  const factory _PC(
      {int? cpu,
      int? ram,
      int? disk,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String objectId}) = _$_PC;

  factory _PC.fromJson(Map<String, dynamic> json) = _$_PC.fromJson;

  @override
  int? get cpu;
  @override
  int? get ram;
  @override
  int? get disk;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get objectId;
  @override
  @JsonKey(ignore: true)
  _$PCCopyWith<_PC> get copyWith => throw _privateConstructorUsedError;
}
