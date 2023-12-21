class CategoryModel {
  final String id;
  final String title;
  final String imagePath;
  final int numOfProducts;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.numOfProducts});
  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
        id: json['id'],
        title: json['title'],
        imagePath: json['image'],
        numOfProducts: json['numOfProducts']);
  }
}
