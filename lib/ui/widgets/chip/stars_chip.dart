import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  final double stars;

  const StarsChip({
    super.key,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star,
        color: Colors.purple,
        size: 16,
      ),
      label: Text(
        stars.toStringAsFixed(1),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.purple.withOpacity(0.1),
    );
  }
}