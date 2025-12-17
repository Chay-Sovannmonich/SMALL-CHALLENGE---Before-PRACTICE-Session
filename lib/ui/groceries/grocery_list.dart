import 'package:flutter/material.dart';
import '/models/grocery.dart';
import '../../data/mock_grocery_repository.dart';
import 'grocery_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {


  void onCreate(BuildContext context) async {
    // TODO-4 - Navigate to the form screen using the Navigator push 
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NewItem()),
    );
    if(result == null) {
      return;
    }
    setState(() {
      dummyGroceryItems.add(result);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
       // TODO-1 - Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) => GroceryTile(grocery: dummyGroceryItems[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => {onCreate(context)},
                icon: const Icon(Icons.add),
              );
            }
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
      // TODO-2 - Display groceries with an Item builder and  LIst Tile
    return ListTile(
      leading: SizedBox(
        width:15,
        height: 15,
        child: Container(
          decoration: BoxDecoration(
            color: grocery.category.color,
          ),
        ),
      ),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}