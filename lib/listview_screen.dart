// Create a entire screen with app bar and list view that will show list of 100 items present on the screen.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Screen'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            onTap: () {
              GoRouter.of(context).push('/detail/$index');
            },
          );
        },
      ),
    );
  }
}
