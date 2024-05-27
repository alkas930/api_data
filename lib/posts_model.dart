// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Assuming the JSON response is for a single product
    return Product(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      discountPercentage: json["discountPercentage"].toDouble(),
      rating: json["rating"].toDouble(),
      stock: json["stock"],
      brand: json["brand"],
      category: json["category"],
      thumbnail: json["thumbnail"],
      images: List<String>.from(json["images"].map((x) => x)),
    );
  }
}
