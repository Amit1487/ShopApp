import 'package:clean_framework/clean_framework.dart';

class ProductDetailEntity extends Entity {
  ProductDetailEntity({
    this.name = '',
  });

  final String name;

  @override
  List<Object?> get props => [name];

  @override
  ProductDetailEntity copyWith({
    String? name,
  }) {
    return ProductDetailEntity(
      name: name ?? this.name,
    );
  }
}
