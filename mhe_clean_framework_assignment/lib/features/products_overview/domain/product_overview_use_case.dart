import 'package:clean_framework/clean_framework.dart';

import '../external_interface/shopapp_collection_gateway.dart';

import 'product_overview_entity.dart';
import 'product_overview_ui_output.dart';

class ProductOverviewUseCase extends UseCase<ProductOverviewEntity> {
  ProductOverviewUseCase()
      : super(
          entity: ProductOverviewEntity(),
          transformers: [
            ProductOverviewUIOutputTransformer(),
          ],
        );

  Future<void> fetchProducts() async {
    print(
        'ProductoverviewViewModel inside fetch Products going to make request');
    await request<ProductCollectionGatewayOutput,
        ProductCollectionSuccessInput>(
      ProductCollectionGatewayOutput(),
      onSuccess: (success) {
        print('ProductoverviewViewModel inside  req response on success');
        // final products = success.productIdentities.map(_resolveProducts);
        final products = success.productIdentities;

        return entity.copyWith(
          products: products.toList(growable: false),
        );
      },
      onFailure: (failure) {
        return entity;
      },
    );
  }
}

class ProductOverviewUIOutputTransformer
    extends OutputTransformer<ProductOverviewEntity, ProductOverviewUIOutput> {
  @override
  ProductOverviewUIOutput transform(ProductOverviewEntity entity) {
    final filteredProducts = entity.products;

    return ProductOverviewUIOutput(
      products: filteredProducts.toList(growable: false),
    );
  }
}
