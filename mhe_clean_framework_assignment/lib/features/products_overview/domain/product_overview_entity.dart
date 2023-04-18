import 'package:clean_framework/clean_framework.dart';

import '../external_interface/shopapp_collection_gateway.dart';

class ProductOverviewEntity extends Entity {
  ProductOverviewEntity({
    this.products = const [],
  });

  final List<ProductIdentity> products;

  @override
  List<Object?> get props {
    return [products];
  }

  @override
  ProductOverviewEntity copyWith({
    List<ProductIdentity>? products,
    String? productNameQuery,
  }) {
    return ProductOverviewEntity(
      products: products ?? this.products,
    );
  }
}
