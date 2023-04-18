import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import 'package:mhe_clean_assignment/features/product_detail/presentation/product_detail_view_model.dart';
import '../../../providers.dart';
import '../domain/product_detail_ui_output.dart';
import '../domain/product_detail_use_case.dart';

class ProductDetailPresenter extends Presenter<ProductDetailViewModel,
    ProductDetailUIOutput, ProductDetailUseCase> {
  ProductDetailPresenter({
    required super.builder,
    required this.name,
  }) : super(provider: productDetailUseCaseProvider);

  final String name;

  @protected
  void onLayoutReady(BuildContext context, ProductDetailUseCase useCase) {
    useCase.fetchProductDetail(name);
  }

  @override
  ProductDetailViewModel createViewModel(
    ProductDetailUseCase useCase,
    ProductDetailUIOutput output,
  ) {
    return ProductDetailViewModel(
      name: output.name,
    );
  }
}
