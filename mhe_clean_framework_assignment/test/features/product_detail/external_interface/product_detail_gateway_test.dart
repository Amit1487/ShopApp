import 'package:clean_framework/clean_framework.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/core/shopapp/shopapp_success_response.dart';
import 'package:mhe_clean_assignment/features/product_detail/external_interface/shopapp_product_detail_gateway.dart';

void main() {
  group('ProductDetailGateway tests |', () {
    test('verify request', () async {
      final gateway = ProductDetailGateway();
      final gatewayOutput = ProductDetailGatewayOutput(name: 'Red Shirt');

      final request = await gateway.buildRequest(gatewayOutput);

      expect(request.resource, equals('Red Shirt'));

      expect(gatewayOutput, ProductDetailGatewayOutput(name: 'Red Shirt'));
    });

    test('success', () async {
      final gateway = ProductDetailGateway()
        ..feedResponse(
          (request) async => Either.right(
            ProductSuccessResponse(
              data: {
                'name': 'Red Shirt',
              },
            ),
          ),
        );

      final input = await gateway.buildInput(
        ProductDetailGatewayOutput(name: 'Red Shirt'),
      );

      expect(input.isRight, isTrue);

      final productDetailModel = input.right.name;

      expect(productDetailModel.name, equals('Red Shirt'));
    });

    test('failure', () async {
      final gateway = ProductDetailGateway()
        ..feedResponse(
          (request) async => Either.left(
            UnknownFailureResponse('No Internet'),
          ),
        );

      final input = await gateway.buildInput(
        ProductDetailGatewayOutput(name: 'Red Shirt'),
      );

      expect(input.isLeft, isTrue);

      expect(input.left.message, equals('No Internet'));
    });
  });
}
