import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/hom_page/hompage.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool a = true;
  int _selectedIndex = 0; // To keep track of the selected bottom nav bar item

  // Method to change the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of widgets for different tabs
  static const List<Widget> _widgetOptions = <Widget>[
    Hompage(), // For Home Page (Instagram feed)
    Center(child: Text('Search Page', style: TextStyle(fontSize: 24))), // Search Tab
    Center(child: Text('Add Post Page', style: TextStyle(fontSize: 24))), // Add Post Tab
    Center(child: Text('Notifications Page', style: TextStyle(fontSize: 24))), // Notifications Tab
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))), // Profile Tab
  ];

  @override
  Widget build(BuildContext context) {
    // Detect current theme mode
   
    return Scaffold(
     
      body: _widgetOptions[_selectedIndex], // Show the selected page's content
     bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box_outlined),
      label: 'Add',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage('images/78.jpg'), // Profile image
      ),
      label: 'Profile',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.grey,
  onTap: _onItemTapped, // Handle tap on navigation bar item
),

    );
  }
}