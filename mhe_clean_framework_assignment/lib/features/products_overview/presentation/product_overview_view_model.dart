import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/foundation.dart';

import '../external_interface/shopapp_collection_gateway.dart';
import '../models/shopapp_model.dart';

class ProductOverviewViewModel extends ViewModel {
  ProductOverviewViewModel({
    required this.products,
  });

  final List<ProductIdentity> products;

  @override
  List<Object?> get props {
    return [products];
  }
}
