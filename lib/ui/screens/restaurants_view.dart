import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import '../screens/restaurant_comments_view.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});
  final List<Restaurant> restaurants;
  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    List<Restaurant> filteredRestaurants = isChecked
        ? widget.restaurants
            .where((restaurant) => restaurant.type.name == "khmer")
            .toList()
        : widget.restaurants;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Text('Show only Khmer restaurants'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantCommentsView(
                            restaurant: restaurant,
                          ),
                        ),
                      );
                    },
                    title: Text(restaurant.name),
                    subtitle: Row(
                      children: [
                        StarsChip(stars: restaurant.stars),
                        const SizedBox(width: 8),
                        RestaurantTypeChip(type: restaurant.type),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}