// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PC _$$_PCFromJson(Map<String, dynamic> json) => _$_PC(
      cpu: json['cpu'] as int?,
      ram: json['ram'] as int?,
      disk: json['disk'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      objectId: json['objectId'] as String,
    );

Map<String, dynamic> _$$_PCToJson(_$_PC instance) => <String, dynamic>{
      'cpu': instance.cpu,
      'ram': instance.ram,
      'disk': instance.disk,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'objectId': instance.objectId,
    };
