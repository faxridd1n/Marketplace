import 'package:json_annotation/json_annotation.dart';

part 'file_element_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FileElementModel {
  final String id;
  final int order;
  final String url;
  final String fileInfo;
  final String variationId;
  final String productId;
  final bool isVisible;

  FileElementModel({
    this.id = '',
    this.order = -1,
    this.url = '',
    this.fileInfo = '',
    this.variationId = '',
    this.productId = '',
    this.isVisible = false,
  });

  factory FileElementModel.fromJson(Map<String, dynamic> json) => _$FileElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileElementModelToJson(this);
}

class FileElementConverter implements JsonConverter<FileElementModel, Map<String, dynamic>> {
  const FileElementConverter();

  @override
  FileElementModel fromJson(Map<String, dynamic> json) => FileElementModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(FileElementModel object) => {};
}
