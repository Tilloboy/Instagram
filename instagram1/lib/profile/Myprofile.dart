import 'package:flutter/material.dart';
import 'package:instagram1/log%20in%20page/ikkinshilogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('jacob_w'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.portrait)),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Jacob West"),
                accountEmail: Text("jacob@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_picture.jpg'), // profil rasmi
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Home sahifasiga o'tkazish (hozircha Drawer ni yopish)
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context); // Profile sahifasiga o'tkazish (hozircha Drawer ni yopish)
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context); // Settings sahifasiga o'tkazish (hozircha Drawer ni yopish)
                },
              ),
              ListTile(
  leading: Icon(Icons.logout),
  title: Text('Logout'),
  onTap: () async {
    // SharedPreferences orqali foydalanuvchi login ma'lumotlarini tozalash
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Foydalanuvchini login sahifasiga qaytarish
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => loginstatus()),
      (route) => false, // Barcha oldingi sahifalarni tozalab yangi sahifa ochiladi
    );
  },
),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // GridView
            GridView.builder(
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
                        builder: (context) =>
                            FullImageScreen(imagePath: assetImages[index]),
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
            // Ikkinchi tab uchun kontent
            Center(child: Text('Ikkinchi tab kontenti')),
          ],
        ),
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