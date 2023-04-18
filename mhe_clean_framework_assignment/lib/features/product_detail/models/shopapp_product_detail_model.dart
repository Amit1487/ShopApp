import 'package:clean_framework/clean_framework.dart';

class ProductDetailModel {
  ProductDetailModel({
    required this.name,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    final deserializer = Deserializer(json);

    return ProductDetailModel(
      name: deserializer.getString('name'),
    );
  }

  final String name;
}

class ProductStatModel {
  ProductStatModel({
    required this.name,
  });

  factory ProductStatModel.fromJson(Map<String, dynamic> json) {
    final deserializer = Deserializer(json);
    final stat = deserializer('stat');

    return ProductStatModel(
      name: stat.getString('name'),
    );
  }

  final String name;
}
