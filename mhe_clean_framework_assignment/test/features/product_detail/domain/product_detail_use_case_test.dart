import 'package:clean_framework/clean_framework.dart';

import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/features/product_detail/domain/product_detail_entity.dart';
import 'package:mhe_clean_assignment/features/product_detail/domain/product_detail_ui_output.dart';
import 'package:mhe_clean_assignment/features/product_detail/domain/product_detail_use_case.dart';
import 'package:mhe_clean_assignment/features/product_detail/external_interface/shopapp_product_detail_gateway.dart';
import 'package:mhe_clean_assignment/features/product_detail/models/shopapp_product_detail_model.dart';
import 'package:mhe_clean_assignment/providers.dart';

void main() {
  group('ProductDetailUseCase tests |', () {
    useCaseTest<ProductDetailUseCase, ProductDetailEntity,
        ProductDetailUIOutput>(
      'fetches product detail',
      provider: productDetailUseCaseProvider,
      execute: (useCase) {
        useCase
            .subscribe<ProductDetailGatewayOutput, ProductDetailSuccessInput>(
          (output) {
            return Either.right(
              ProductDetailSuccessInput(
                name: ProductDetailModel(name: 'Red'),
              ),
            );
          },
        );

        useCase.fetchProductDetail('Red');
      },
      expect: () => [
        ProductDetailUIOutput(
          name: 'Red',
        ),
      ],
      verify: (useCase) {
        expect(
          useCase.debugEntity,
          ProductDetailEntity(
            name: 'Red',
          ),
        );
      },
    );

    useCaseTest<ProductDetailUseCase, ProductDetailEntity,
        ProductDetailUIOutput>(
      'fetches product detail; description failure',
      provider: productDetailUseCaseProvider,
      execute: (useCase) {
        useCase
            .subscribe<ProductDetailGatewayOutput, ProductDetailSuccessInput>(
          (output) {
            return Either.right(
              ProductDetailSuccessInput(
                name: ProductDetailModel(
                  name: '',
                ),
              ),
            );
          },
        );

        useCase.fetchProductDetail('Yellow scarf');
      },
      expect: () => [
        ProductDetailUIOutput(
          name: '',
        ),
      ],
    );
  });
}
