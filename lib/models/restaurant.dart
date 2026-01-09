import 'restaurant_type.dart';

class RestaurantComment {
  final int stars;
  final String feedback;

  RestaurantComment({
    required this.stars,
    required this.feedback,
  });
}

class Restaurant {
  final String name;
  final RestaurantType type;
  final List<RestaurantComment> comments;
 
  Restaurant({
    required this.name,
    required this.type,
    List<RestaurantComment>? comments,
  }) : comments = comments ?? [];

  double get stars {
    if (comments.isEmpty) {
      return 0.0;
    }   
    double total = 0;
    for (var comment in comments) {
      total += comment.stars;
    } 
    return total / comments.length;
  }
}