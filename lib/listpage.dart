import 'package:flutter/material.dart';
import 'beranda.dart';

class ListPage extends StatelessWidget {
  final GridItem selectedItem;
  final List<GridItem> items;

  ListPage({required this.selectedItem, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Wisata'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Image.asset(
              item.imagePath,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.contain,
            ),
            title: Text(item.title),
            subtitle: Text(item.description),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BerandaPage()),
          );
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
