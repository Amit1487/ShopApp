import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/features/products_overview/domain/product_overview_entity.dart';
import 'package:mhe_clean_assignment/features/products_overview/domain/product_overview_ui_output.dart';
import 'package:mhe_clean_assignment/features/products_overview/domain/product_overview_use_case.dart';
import 'package:mhe_clean_assignment/features/products_overview/external_interface/shopapp_collection_gateway.dart';
import 'package:mhe_clean_assignment/features/products_overview/presentation/product_overview_presenter.dart';
import 'package:mhe_clean_assignment/features/products_overview/presentation/product_overview_view_model.dart';
import 'package:mhe_clean_assignment/providers.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('ProductOverviewPresenter tests |', () {
    presenterTest<ProductOverviewViewModel, ProductOverviewUIOutput,
        ProductOverviewUseCase>(
      'creates proper view model',
      create: (builder) => ProductOverviewPresenter(builder: builder),
      overrides: [
        productOverviewUseCaseProvider
            .overrideWith(ProductOverviewUseCaseFake()),
      ],
      setup: (useCase) {
        useCase.debugEntityUpdate(
          (e) => e.copyWith(
            products: [
              ProductIdentity(name: 'TShirt', imageUrl: ''),
              ProductIdentity(name: 'Scarf', imageUrl: ''),
            ],
          ),
        );
      },
      expect: () => [
        isA<ProductOverviewViewModel>()
            .having((vm) => vm.products, 'products', []),
        isA<ProductOverviewViewModel>().having(
          (vm) => vm.products.map((p) => p.name),
          'products',
          ['TShirt', 'Scarf'],
        ),
      ],
    );
  });
}

class ProductOverviewUseCaseFake extends ProductOverviewUseCase {
  @override
  Future<void> fetchProducts() async {}
}
