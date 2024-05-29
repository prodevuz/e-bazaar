import 'package:ebazaar/utils/logging/logger.dart';

class ProductAttributeModel {
  String? name;
  final List<String>? values;
  ProductAttributeModel({this.name, this.values});

  ProductAttributeModel copyWith({String? name, List<String>? values}) {
    LoggerHelper.info("Called ProductAttributeModel.copyWith()");
    return ProductAttributeModel(
      name: name ?? this.name,
      values: values ?? this.values,
    );
  }

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Values': values,
      };

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
