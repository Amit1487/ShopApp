import 'package:clean_framework/clean_framework.dart';

import '../external_interface/shopapp_product_detail_gateway.dart';
import 'product_detail_entity.dart';
import 'product_detail_ui_output.dart';

class ProductDetailUseCase extends UseCase<ProductDetailEntity> {
  ProductDetailUseCase()
      : super(
          entity: ProductDetailEntity(),
          transformers: [ProfileUIOutputTransformer()],
        );

  void fetchProductDetail(String name) {
    final productName = name.toLowerCase();

    request<ProductDetailGatewayOutput, ProductDetailSuccessInput>(
      ProductDetailGatewayOutput(name: productName),
      onSuccess: (success) {
        final product = success.name;

        return entity.copyWith(
          name: product.name,
        );
      },
      onFailure: (failure) => entity,
    );
  }
}

class ProfileUIOutputTransformer
    extends OutputTransformer<ProductDetailEntity, ProductDetailUIOutput> {
  @override
  ProductDetailUIOutput transform(ProductDetailEntity entity) {
    return ProductDetailUIOutput(name: entity.name);
  }
}
