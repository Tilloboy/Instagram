import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Aktiv rasmlar ro'yxati
  final List<String> assetImages = [
    "images/1.jpg",
    "images/2.jpg",
    "images/59.jpg",
    "images/60.jpg",
    "images/61.jpg",
    "images/62.jpg",
    "images/63.jpg",
    "images/64.jpg",
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            onChanged: (text) {
              setState(() {
                query = text;
              });
            },
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Bir qatorga 3 ta rasm sig'adi
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: assetImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullImageScreen(imagePath: assetImages[index]),
                ),
              );
            },
            child: Image.asset(
              assetImages[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class FullImageScreen extends StatelessWidget {
  final String imagePath;

  FullImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
