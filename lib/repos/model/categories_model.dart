class CategoriesModel {
  final String categoryName;
  final String categoryImage;
  final String categoryId;

  CategoriesModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  factory CategoriesModel.fromJson( json) =>
      CategoriesModel(
        categoryName: json["categoryName"],
        categoryImage: json["categoryImage"],
        categoryId: json["categoryId"],
      );
}
