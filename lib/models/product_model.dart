class ProductModel {
  final String id;
  final String title;
  final int price;
  final String category;
  final String image;
  final String subTitle;
  final String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.subTitle,
    required this.description,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      subTitle: json['subTitle'],
      description: json['description'],
    );
  }
}
