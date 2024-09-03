class Product {
  int? id;
  String? title;
  String? description;
  String? image;
  double? price;
  String? category;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.description,
    this.image,
    this.price,
    this.category,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price']?.toDouble(),
      category: json['category'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate']?.toDouble(),
      count: json['count'],
    );
  }
}
