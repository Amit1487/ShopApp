import 'package:clean_framework/clean_framework.dart';

class ProductDetailUIOutput extends Output {
  ProductDetailUIOutput({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [name];
}
