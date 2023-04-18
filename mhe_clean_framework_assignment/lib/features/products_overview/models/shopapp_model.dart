class ProductModel {
  ProductModel({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => name.hashCode ^ imageUrl.hashCode;
}
