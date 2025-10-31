class Product {
  final String id;
  final String title;

  final double price;
  final String imageUrl;
  final bool isFavorite;

  Product({
    required this.id,
    required this.title,

    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],

      price: json['price'],
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'] ?? true,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,

      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
