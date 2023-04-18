import 'package:clean_framework/clean_framework.dart';

import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:flutter/material.dart';

import '../../../routing/routes.dart';
import '../../../widgets/product_card.dart';
import 'product_overview_presenter.dart';
import 'product_overview_view_model.dart';

class ProductOverviewUI extends UI<ProductOverviewViewModel> {
  @override
  ProductOverviewPresenter create(WidgetBuilder builder) {
    print(' ProductOverviewUI inside Present create method');
    return ProductOverviewPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, ProductOverviewViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    Widget child = GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final product = viewModel.products[index];

        return ProductItem(
          key: ValueKey(product.name),
          imageUrl: product.imageUrl,
          name: product.name,
          heroTag: product.name,
          onTap: () {
            context.router.go(
              Routes.productdetail,
              params: {'product_name': product.name},
              queryParams: {'image': product.imageUrl},
            );
          },
        );
      },
      itemCount: viewModel.products.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        centerTitle: false,
        titleTextStyle: textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ),
      body: child,
    );
  }
}
