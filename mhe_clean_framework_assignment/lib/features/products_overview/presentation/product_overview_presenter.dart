import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';

import '../../../providers.dart';
import '../domain/product_overview_ui_output.dart';
import '../domain/product_overview_use_case.dart';
import 'product_overview_view_model.dart';

class ProductOverviewPresenter extends Presenter<ProductOverviewViewModel,
    ProductOverviewUIOutput, ProductOverviewUseCase> {
  ProductOverviewPresenter({
    required super.builder,
  }) : super(provider: productOverviewUseCaseProvider);

  @override
  void onLayoutReady(BuildContext context, ProductOverviewUseCase useCase) {
    print(
        'ProductOverviewPresenter inside onLayoutReady method going to fetch products');
    useCase.fetchProducts();
  }

  @override
  ProductOverviewViewModel createViewModel(
      ProductOverviewUseCase useCase, ProductOverviewUIOutput output) {
    print(
        ' ProductOverviewPresenter ProductOverviewViewModel inside  createViewModel going to init ProductOverviewViewModel');
    return ProductOverviewViewModel(
      products: output.products,
    );
  }
}
