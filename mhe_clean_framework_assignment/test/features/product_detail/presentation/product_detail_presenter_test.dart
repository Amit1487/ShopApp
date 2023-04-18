import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/features/product_detail/domain/product_detail_ui_output.dart';
import 'package:mhe_clean_assignment/features/product_detail/domain/product_detail_use_case.dart';
import 'package:mhe_clean_assignment/features/product_detail/presentation/product_detail_presenter.dart';
import 'package:mhe_clean_assignment/features/product_detail/presentation/product_detail_view_model.dart';
import 'package:mhe_clean_assignment/providers.dart';

void main() {
  group('ProductDetailPresenter tests |', () {
    presenterTest<ProductDetailViewModel, ProductDetailUIOutput,
        ProductDetailUseCase>(
      'creates proper view model',
      create: (builder) => ProductDetailPresenter(
        builder: builder,
        name: 'Red Shirt',
      ),
      overrides: [
        productDetailUseCaseProvider.overrideWith(ProductDetailUseCaseFake()),
      ],
      setup: (useCase) {
        useCase.debugEntityUpdate(
          (e) => e.copyWith(
            name: 'Red Shirt',
          ),
        );
      },
      expect: () => [
        isA<ProductDetailViewModel>().having((vm) => vm.name, 'name', ''),
        isA<ProductDetailViewModel>()
            .having((vm) => vm.name, 'description', 'Red Shirt'),
      ],
    );
  });
}

class ProductDetailUseCaseFake extends ProductDetailUseCase {
  @override
  void fetchProductDetail(String name) {}
}
