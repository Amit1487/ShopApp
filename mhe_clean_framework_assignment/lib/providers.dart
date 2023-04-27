import 'package:clean_framework/clean_framework.dart';

import 'core/shopapp/shopapp_external_interface.dart';
import 'features/product_detail/domain/product_detail_entity.dart';
import 'features/product_detail/domain/product_detail_use_case.dart';
import 'features/product_detail/external_interface/shopapp_product_detail_gateway.dart';
import 'features/products_overview/domain/product_overview_use_case.dart';
import 'features/products_overview/external_interface/shopapp_collection_gateway.dart';

final productOverviewUseCaseProvider = UseCaseProvider.autoDispose(
  ProductOverviewUseCase.new,
  (bridge) {
    bridge.connect(
      productDetailUseCaseProvider,
      selector: (e) => e.name,
      (oldProductName, productName) {
        // if (oldProductName != productName) {}
      },
    );
  },
);

final productDetailUseCaseProvider =
    UseCaseProvider<ProductDetailEntity, ProductDetailUseCase>(
  ProductDetailUseCase.new,
);

final productCollectionGateway = GatewayProvider(
  ProductCollectionGateway.new,
  useCases: [productOverviewUseCaseProvider],
);

final productProfileDetailGateway = GatewayProvider(
  ProductDetailGateway.new,
  useCases: [productDetailUseCaseProvider],
);

final shopAppExternalInterfaceProvider = ExternalInterfaceProvider(
  ProductExternalInterface.new,
  gateways: [
    productCollectionGateway,
    productProfileDetailGateway,
  ],
);
