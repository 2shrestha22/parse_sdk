import 'package:freezed_annotation/freezed_annotation.dart';
part 'pc.freezed.dart';
part 'pc.g.dart';

@freezed
class PC with _$PC {
  const factory PC({
    String? cpu,
    String? ram,
    String? disk,
    DateTime? createdAt,
  }) = _PC;

  factory PC.fromJson(Map<String, dynamic> json) => _$PCFromJson(json);
}
