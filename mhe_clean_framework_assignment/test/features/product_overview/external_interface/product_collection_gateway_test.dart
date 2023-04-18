import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mhe_clean_assignment/core/shopapp/shopapp_success_response.dart';
import 'package:mhe_clean_assignment/features/products_overview/external_interface/shopapp_collection_gateway.dart';

void main() {
  group('ProductCollectionGateway tests |', () {
    test('verify request', () async {
      final gateway = ProductCollectionGateway();
      final gatewayOutput = ProductCollectionGatewayOutput();

      final request = await gateway.buildRequest(gatewayOutput);

      expect(request.resource, equals('shopping_item'));
      expect(request.queryParams, equals({'limit': 100}));

      expect(gatewayOutput, ProductCollectionGatewayOutput());
    });

    test('success', () async {
      final gateway = ProductCollectionGateway()
        ..feedResponse(
          (request) async => Either.right(
            ProductSuccessResponse(
              data: {
                'results': [
                  {
                    'name': 'Red Shirt',
                    'url':
                        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg'
                  },
                  {
                    'name': 'Yellow scarf',
                    'url':
                        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg/'
                  }
                ]
              },
            ),
          ),
        );

      final input = await gateway.buildInput(ProductCollectionGatewayOutput());

      expect(input.isRight, isTrue);

      final identities = input.right.productIdentities;

      expect(identities.first.name, equals('Red Shirt'));
      expect(identities.first.id, equals(''));

      expect(identities.last.name, equals('Yellow scarf'));
      expect(identities.last.id, equals(''));
    });

    test('failure', () async {
      final gateway = ProductCollectionGateway()
        ..feedResponse(
          (request) async => Either.left(
            UnknownFailureResponse('No Internet'),
          ),
        );

      final input = await gateway.buildInput(ProductCollectionGatewayOutput());

      expect(input.isLeft, isTrue);

      expect(input.left.message, equals('No Internet'));
    });
  });
}
