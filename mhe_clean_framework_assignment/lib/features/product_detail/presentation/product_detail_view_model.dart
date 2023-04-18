import 'package:clean_framework/clean_framework.dart';

class ProductDetailViewModel extends ViewModel {
  ProductDetailViewModel({
    this.name = "",
  });

  final String name;

  @override
  List<Object?> get props => [name];
}
