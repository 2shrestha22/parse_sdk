import 'package:freezed_annotation/freezed_annotation.dart';

part 'parse_file.freezed.dart';
part 'parse_file.g.dart';

@freezed
class ParseFile with _$ParseFile {
  const factory ParseFile({
    required String name,
    required String url,
  }) = _ParseFile;

  factory ParseFile.fromJson(Map<String, dynamic> json) =>
      _$ParseFileFromJson(json);
}
