import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';

import 'product_detail_presenter.dart';
import 'product_detail_view_model.dart';

class ProductDetailUI extends UI<ProductDetailViewModel> {
  ProductDetailUI({
    required this.productName,
    required this.productImageUrl,
  });

  final String productName;
  final String productImageUrl;

  @override
  ProductDetailPresenter create(WidgetBuilder builder) {
    return ProductDetailPresenter(builder: builder, name: productName);
  }

  @override
  Widget build(BuildContext context, ProductDetailViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: false,
      body: Card(
        margin: EdgeInsets.zero,
        elevation: Theme.of(context).brightness == Brightness.light ? 0 : 4,
        color: Theme.of(context).colorScheme.surface.withAlpha(120),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        child: Image.network(
          productImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
