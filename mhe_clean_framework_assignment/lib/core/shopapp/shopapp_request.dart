import 'package:clean_framework/clean_framework.dart';

// abstract class ProductRequest extends Request {
//   Map<String, dynamic> get queryParams => {};
// }

abstract class GetProductRequest extends Request {
  String get resource;
}
