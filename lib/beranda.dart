import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'listpage.dart';

class GridItem {
  final String imagePath;
  final String title;
  final String description;

  GridItem({required this.imagePath, required this.title, required this.description});
}

class BerandaPage extends StatelessWidget {
  final List<GridItem> items = [
    GridItem(
      imagePath: 'assets/budaya.jpg',
      title: 'Wisata Budaya',
      description: 'Deskripsi Gambar 1',
    ),
    GridItem(
      imagePath: 'assets/kuliner.jpg',
      title: 'Wisata Kuliner',
      description: 'Deskripsi Gambar 2',
    ),
    GridItem(
      imagePath: 'assets/alam.jpeg',
      title: 'Wisata Alam',
      description: 'Deskripsi Gambar 3',
    ),
    GridItem(
      imagePath: 'assets/religi.jpg',
      title: 'Wisata Religi',
      description: 'Deskripsi Gambar 3',
    ),
    GridItem(
      imagePath: 'assets/desa_purba.jpeg',
      title: 'Wisata Bahari',
      description: 'Deskripsi Gambar 3',
    ),
    GridItem(
      imagePath: 'assets/candi_brahu.jpg',
      title: 'Wisata Agrowisata',
      description: 'Deskripsi Gambar 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kategori Wisata'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              items: [
                Image.asset('assets/budaya.jpg'),
                Image.asset('assets/kuliner.jpg'),
                Image.asset('assets/alam.jpeg'),
              ],
              options: CarouselOptions(height: 200.0),
            ),
            SizedBox(height: 16.0),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
              children: items.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListPage(selectedItem: item, items: items),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item.imagePath,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          item.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
