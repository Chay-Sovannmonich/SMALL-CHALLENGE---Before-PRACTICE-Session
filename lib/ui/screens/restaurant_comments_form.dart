import 'package:flutter/material.dart';
import '../../models/restaurant.dart';

class RestaurantCommentsForm extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantCommentsForm({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  final TextEditingController _feedbackController = TextEditingController();
  int _stars = 0;
  String _errorMessage = '';

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _submit() {
    final feedback = _feedbackController.text.trim();
    if (feedback.isEmpty) {
      setState(() {
        _errorMessage = 'Enter your feedback';
      });
      return;
    }
    widget.restaurant.comments.add(RestaurantComment(
      stars: _stars,
      feedback: feedback,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How was your dinner?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              labelText: 'Rate the restaurant (0-5 stars)',
              border: OutlineInputBorder(),
            ),
            value: _stars,
            items: List.generate(6, (index) => index).map((stars) {
              return DropdownMenuItem<int>(
                value: stars,
                child: Text('$stars stars'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _stars = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _feedbackController,
            decoration: InputDecoration(
              labelText: 'Any feedback?',
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && _errorMessage.isNotEmpty) {
                setState(() {
                  _errorMessage = '';
                });
              }
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: _submit,
              child: const Text('COMMENT'),
            ),
          ),
        ],
      ),
    );
  }
}