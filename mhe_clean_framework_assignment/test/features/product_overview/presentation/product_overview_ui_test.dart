import 'dart:io';

import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/features/products_overview/external_interface/shopapp_collection_gateway.dart';
import 'package:mhe_clean_assignment/features/products_overview/presentation/product_overview_ui.dart';
import 'package:mhe_clean_assignment/features/products_overview/presentation/product_overview_view_model.dart';
import 'package:mhe_clean_assignment/routing/routes.dart';
import 'package:mhe_clean_assignment/widgets/product_card.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('ProductOverviewUI tests |', () {
    uiTest(
      'shows product list correctly',
      ui: ProductOverviewUI(),
      viewModel: ProductOverviewViewModel(
        products: [
          ProductIdentity(
              name: 'Red Shirt',
              imageUrl:
                  'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg/',
              description: '',
              id: '',
              price: 0),
          ProductIdentity(
              name: 'Yellow scarf',
              imageUrl:
                  'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg/',
              description: '',
              id: '',
              price: 0),
        ],
      ),
      verify: (tester) async {
        Finder gridView = find.byType(GridView);
        expect(gridView, findsOneWidget);
        expect(find.text('Red Shirt'), findsOneWidget);
        expect(find.text('Yellow scarf'), findsOneWidget);
      },
    );

    // uiTest(
    //   'tapping on product navigates to detail page',
    //   ui: ProductOverviewUI(),
    //   viewModel: ProductOverviewViewModel(
    //     products: [
    //       ProductIdentity(
    //           name: 'Red Shirt',
    //           imageUrl:
    //               'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    //           description: '',
    //           id: '',
    //           price: 0),
    //       ProductIdentity(
    //           name: 'A Pan',
    //           imageUrl:
    //               'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    //           description: '',
    //           id: '',
    //           price: 0),
    //     ],
    //   ),
    //   verify: (tester) async {
    //     await tester.pumpAndSettle();

    //     final redShirtCardFinder = find.descendant(
    //       of: find.byType(ProductItem),
    //       matching: find.text('Red Shirt'),
    //     );

    //     expect(redShirtCardFinder, findsOneWidget);

    //     await tester.tap(redShirtCardFinder);
    //     await tester.pumpAndSettle();

    //     final routeData = tester.routeData!;
    //     expect(routeData.route, Routes.productdetail);
    //     expect(routeData.params, equals({'product_name': 'Red Shirt'}));

    //     tester.element(find.byType(MaterialApp)).router.pop();
    //     await tester.pumpAndSettle();

    //     final poppedRouteData = tester.poppedRouteData!;
    //     expect(poppedRouteData.route, Routes.productdetail);
    //     expect(poppedRouteData.params, equals({'product_name': 'A Pan'}));
    //   },
    // );
  });
}
