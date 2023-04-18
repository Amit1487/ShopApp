import 'dart:io';

import 'package:clean_framework_test/clean_framework_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/features/product_detail/presentation/product_detail_ui.dart';
import 'package:mhe_clean_assignment/features/product_detail/presentation/product_detail_view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => HttpOverrides.global = null);
  group('ProductDetailUI tests |', () {
    uiTest(
      'shows Product detail correctly',
      ui: ProductDetailUI(
          productName: 'Red Shirt',
          productImageUrl:
              'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
      viewModel: ProductDetailViewModel(
        name: 'Red Shirt',
      ),
      verify: (tester) async {
        await tester.pumpAndSettle();

        expect(find.text('Red Shirt'), findsOneWidget);
      },
    );
  });
}
