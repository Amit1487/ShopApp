import 'package:clean_framework/clean_framework.dart';

import '../../../core/shopapp/shopapp_request.dart';
import '../../../core/shopapp/shopapp_success_response.dart';
import '../models/shopapp_product_detail_model.dart';

class ProductDetailGateway extends Gateway<ProductDetailGatewayOutput,
    ProductDetailRequest, ProductSuccessResponse, ProductDetailSuccessInput> {
  @override
  ProductDetailRequest buildRequest(ProductDetailGatewayOutput output) {
    return ProductDetailRequest(name: output.name);
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }

  @override
  ProductDetailSuccessInput onSuccess(ProductSuccessResponse response) {
    return ProductDetailSuccessInput(
      name: ProductDetailModel.fromJson(response.data),
    );
  }
}

class ProductDetailGatewayOutput extends Output {
  ProductDetailGatewayOutput({required this.name});

  final String name;

  @override
  List<Object?> get props => [name];
}

class ProductDetailSuccessInput extends SuccessInput {
  ProductDetailSuccessInput({required this.name});

  final ProductDetailModel name;
}

class ProductDetailRequest extends GetProductRequest {
  ProductDetailRequest({required this.name});

  final String name;

  @override
  String get resource => '$name';
}
