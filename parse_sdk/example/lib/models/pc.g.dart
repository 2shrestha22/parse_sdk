// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PC _$$_PCFromJson(Map<String, dynamic> json) => _$_PC(
      cpu: json['cpu'] as String?,
      ram: json['ram'] as String?,
      disk: json['disk'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      objectId: json['objectId'] as String?,
    );

Map<String, dynamic> _$$_PCToJson(_$_PC instance) => <String, dynamic>{
      'cpu': instance.cpu,
      'ram': instance.ram,
      'disk': instance.disk,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'objectId': instance.objectId,
    };
