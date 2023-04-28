import 'package:clean_framework/clean_framework.dart';

import '../../../core/shopapp/shopapp_request.dart';
import '../../../core/shopapp/shopapp_success_response.dart';

class ProductCollectionGateway extends Gateway<
    ProductCollectionGatewayOutput,
    ProductCollectionRequest,
    ProductSuccessResponse,
    ProductCollectionSuccessInput> {
  ProductCollectionRequest buildRequest(ProductCollectionGatewayOutput output) {
    print('ProductCollectionGateway inside build request ');
    return ProductCollectionRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }

//response.data to nbe deserialised and the items can be accessed using keys.
  @override
  ProductCollectionSuccessInput onSuccess(ProductSuccessResponse response) {
    print(
        'ProductCollectionGateway inside ProductCollectionSuccessInput onSuccess ');
    return ProductCollectionSuccessInput(
      productIdentities: _items,
    );
  }

  final List<ProductIdentity> _items = [
    ProductIdentity(
      id: '',
      name: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    ProductIdentity(
      id: '',
      name: 'Yellow scarf',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
  ];
}

class ProductCollectionGatewayOutput extends Output {
  ProductCollectionGatewayOutput();

  @override
  List<Object?> get props => [];
}

class ProductCollectionSuccessInput extends SuccessInput {
  ProductCollectionSuccessInput({required this.productIdentities});

  final List<ProductIdentity> productIdentities;
}

class ProductIdentity {
  ProductIdentity({
    this.name = '',
    this.id = '',
    this.description = '',
    this.price = 0.0,
    this.imageUrl = '',
  });

  String name;
  String id;
  String description;
  double price;
  String imageUrl;

  // factory ProductIdentity.fromJson(Map<String, dynamic> json) {
  //   final deserializer = Deserializer(json);

  //   return ProductIdentity(
  //     name: deserializer.getString('name'),
  //     id: '0',
  //     description: deserializer.getString('description'),
  //     price: 0.0,
  //     imageUrl: deserializer.getString('imageUrl'),
  //   );
  // }
}

class ProductCollectionRequest extends GetProductRequest {
  @override
  String get resource => 'shopping_item';

  // @override
  // Map<String, dynamic> get queryParams => {'limit': 100};
}
