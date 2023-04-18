import 'package:clean_framework/clean_framework.dart';

import '../external_interface/shopapp_collection_gateway.dart';

class ProductOverviewUIOutput extends Output {
  ProductOverviewUIOutput({
    required this.products,
  });

  final List<ProductIdentity> products;

  @override
  List<Object?> get props => [products];
}
