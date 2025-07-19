class HomePopularFoodEntity {
  int id;
  String name;
  String description;
  String image;
  int categoryId;
  double price;
  int restaurantId;
  double avgRating;
  String restaurantName;
  String imageFullUrl;

  HomePopularFoodEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.price,
    required this.restaurantId,
    required this.avgRating,
    required this.restaurantName,
    required this.imageFullUrl,
  });
}
