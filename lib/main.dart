import 'package:flutter/material.dart';
import 'models/restaurant.dart';
import 'models/restaurant_type.dart';
import 'ui/screens/restaurants_view.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.main,
      debugShowCheckedModeBanner: false,
      home: RestaurantsView(restaurants: allRestaurants),
    );
  }

  List<Restaurant> get allRestaurants {
    List<Restaurant> result = [
      Restaurant(
        name: 'Flutter Burger',
        type: RestaurantType.khmer,
        comments: [
          RestaurantComment(stars: 4, feedback: 'Good'),
        ],
      ),
      
      Restaurant(
        name: 'Les croissants de Ronan',
        type: RestaurantType.french,
        comments: [
          RestaurantComment(stars: 5, feedback: 'The Best'),
          RestaurantComment(stars: 5, feedback: 'Amazon!'),
          RestaurantComment(stars: 4, feedback: 'let him cook'),
        ],
      ),
      
      Restaurant(
        name: 'La Pizza Del Ronano (the best)',
        type: RestaurantType.italian,
        comments: [
          RestaurantComment(stars: 3, feedback: 'Nice'),
        ],
      ),
      
      Restaurant(
        name: 'Final Tacos',
        type: RestaurantType.mexican,
        comments: [],
      ),
      
      Restaurant(
        name: 'No money no Rice',
        type: RestaurantType.streetfood,
        comments: [],
      ),

      Restaurant(
        name: 'Ronano the Besto',
        type: RestaurantType.khmer,
        comments: [],
      ),
    ];
    return result;
  }
}