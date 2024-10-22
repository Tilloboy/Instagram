import 'package:flutter/material.dart';
import 'package:instagram1/log%20in%20page/ikkinshilogin.dart';
import 'package:instagram1/profile/edit_profile.dart';
import 'package:instagram1/profile/followers.dart';
import 'package:instagram1/profile/following.dart';
import 'package:instagram1/profile/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name = "Gaa_bi_sgm";
  String username = "@Kanekiken_002";
  String website = "www.example.com";
  String bio =
      "Hello, I'm a \n Mobile developer 'If you have any work, feel free to tell me' but it's paid";

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? name;
      username = prefs.getString('username') ?? username;
      website = prefs.getString('website') ?? website;
      bio = prefs.getString('bio') ?? bio;
    });
  }

  final List<String> assetImages = [
    "images/i0.jpg",
    "images/i1.jpg",
    "images/i2.jpg",
    "images/i3.jpg",
    "images/i4.jpg",
    "images/i5.jpg",
    "images/i6.jpg",
    "images/i7.jpg",
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock),
              Text(name),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(username),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/i31.jpg'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Settings(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () async {
                  // SharedPreferences orqali foydalanuvchi login ma'lumotlarini tozalash
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear();

                  // Foydalanuvchini login sahifasiga qaytarish
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => loginstatus()),
                    (route) =>
                        false, // Barcha oldingi sahifalarni tozalab yangi sahifa ochiladi
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/i31.jpg'),
                    ),
                    Expanded(
                      
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatColumn("8", "Posts"),
                              GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyApp(),
                              ));
                        },child: 
                              Container(
                                width: 65,
                                height: 50,
                                child: Column(
                                  children: [
                                    Text(
                                      "999",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Followers",
                                    ),
                                  ],
                                ),
                              ),),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Following(),
                                      ));
                                },
                                child: Container(
                                  width: 65,
                                  height: 50,
                                  child: Column(
                                    children: [
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Following",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bio,
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: OutlinedButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(
                                  currentName: name,
                                  currentUsername: username,
                                  currentWebsite: website,
                                  currentBio: bio,
                                ),
                              ),
                            );
                            if (result != null) {
                              setState(() {
                                name = result['name'];
                                username = result['username'];
                                website = result['website'];
                                bio = result['bio'];
                              });
                            }
                          },
                          child: Text("Edit Profile"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStoryHighlight("New", Icons.add),
                              _buildStoryHighlight("Friends", Icons.person),
                              _buildStoryHighlight("Sport", Icons.sports),
                              _buildStoryHighlight("Design", Icons.palette),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Adding TabBar on top of GridView
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.grid_on)),
                  Tab(icon: Icon(Icons.portrait)),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
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
                                builder: (context) => FullImageScreen(
                                    imagePath: assetImages[index]),
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
                    Center(child: Text('Second tab content')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildStoryHighlight(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}

Widget _buildStatColumn(String number, String label) {
  return Column(
    children: [
      Text(
        number,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Text(label),
    ],
  );
}

Widget _buildStoryHighlight(String label, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 35,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    ),
  );
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}
