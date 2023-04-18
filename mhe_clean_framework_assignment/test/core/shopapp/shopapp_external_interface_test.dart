import 'dart:io';

import 'package:clean_framework/clean_framework.dart' hide Response;
import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/core/dependency_providers.dart';
import 'package:mhe_clean_assignment/core/shopapp/shopapp_request.dart';
import 'package:mhe_clean_assignment/providers.dart';

import 'package:mocktail/mocktail.dart';

void main() {
  group('ShopAppExternalInterface tests |', () {
    test('get request success', () async {
      final container = ProviderContainer(
        overrides: [
          restClientProvider.overrideWith(DioMock()),
        ],
      );

      final interface = shopAppExternalInterfaceProvider.read(container);
      final dio = restClientProvider.read(container);

      when(
        () => dio.get<Map<String, dynamic>>(
          'product',
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: {'name': 'product'},
          requestOptions: RequestOptions(path: 'product'),
        ),
      );

      final result = await interface.request(TestProductRequest());

      expect(result.isRight, isTrue);
      expect(result.right.data, equals({'name': 'product'}));
    });
  });
}

class TestProductRequest extends GetProductRequest {
  @override
  String get resource => 'product';
}

class DioMock extends Mock implements Dio {}
