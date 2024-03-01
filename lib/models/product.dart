import 'dart:convert';

class Product {
  final String name;
  final double price;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final String? id;
  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    this.id,
  });

  Product copyWith({
    String? name,
    double? price,
    String? description,
    double? quantity,
    List<String>? images,
    String? category,
    String? id,
    String? userId,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      category: category ?? this.category,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(
        (map['images']),
      ),
      category: map['category'] ?? '',
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
