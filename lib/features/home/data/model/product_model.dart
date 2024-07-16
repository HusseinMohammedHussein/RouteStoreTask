class ProductModel {
  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.thumbnail,
      this.price,
      this.discountPercentage,
      this.rating,
      this.isFavorite = false});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: int.parse(jsonData['id'].toString()),
      title: jsonData['title'].toString(),
      description: jsonData['description'].toString(),
      price: double.parse(jsonData['price'].toString()),
      discountPercentage:
          double.parse(jsonData['discountPercentage'].toString()),
      rating: double.parse(jsonData['rating'].toString()),
      thumbnail: jsonData['thumbnail'].toString(),
    );
  }

  int? id;
  String? title;
  String? description;
  String? thumbnail;
  double? price;
  double? discountPercentage;
  double? rating;
  bool isFavorite;
}

class GetAllProducts {
  GetAllProducts({required this.products});

  factory GetAllProducts.fromJson(Map<String, dynamic> jsonData) {
    return GetAllProducts(
      products: List<ProductModel>.from(
        jsonData['products'].map((i) => ProductModel.fromJson(i)),
      ),
    );
  }

  final List<ProductModel> products;
}
