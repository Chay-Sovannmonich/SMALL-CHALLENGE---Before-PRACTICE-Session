import 'package:flutter/material.dart';
import '../../../models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  final RestaurantType type;

  const RestaurantTypeChip({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        type.name.toUpperCase(),
        style: const TextStyle(fontSize: 12),
      ),
      backgroundColor: type.color.withOpacity(0.8),
    );
  }
}