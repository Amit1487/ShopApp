import 'package:clean_framework/clean_framework.dart';
import 'package:mhe_clean_assignment/core/shopapp/shopapp_request.dart';
import 'package:mhe_clean_assignment/core/shopapp/shopapp_success_response.dart';

class ProductExternalInterface
    extends ExternalInterface<ProductRequest, ProductSuccessResponse> {
  @override
  void handleRequest() {
    //create url provider in case want to get data from backend. and provide the url to create client to make server request.

    on<GetProductRequest>(
      (request, send) async {
        Map<String, dynamic> data = {
          "name": request.resource,
        }; //new Map<String, dynamic>();

        send(ProductSuccessResponse(data: data));
      },
    );
  }

  @override
  FailureResponse onError(Object error) {
    return UnknownFailureResponse(error);
  }
}
