import 'package:clean_framework_router/clean_framework_router.dart';

import '../features/product_detail/presentation/product_detail_ui.dart';
import '../features/products_overview/presentation/product_overview_ui.dart';

enum Routes with RoutesMixin {
  productoverview('/'),
  productdetail(':product_name');

  const Routes(this.path);

  @override
  final String path;
}

class ShopAppRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(
      routes: [
        AppRoute(
          route: Routes.productoverview,
          builder: (_, __) => ProductOverviewUI(),
          routes: [
            AppRoute.custom(
              route: Routes.productdetail,
              builder: (_, state) {
                return ProductDetailUI(
                  productName: state.params['product_name'] ?? '',
                  productImageUrl: state.queryParams['image'] ?? '',
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
