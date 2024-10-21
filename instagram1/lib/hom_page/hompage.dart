import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/hom_page/hompage_instagram_post.dart';
import 'package:instagram1/hom_page/hompage_storis.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  bool a = true;

  void b() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Detect current theme mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Icon(
            CupertinoIcons.camera,
            size: 32,
            weight: 5,
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'insta',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              width: 100,
              height: 50,
              // Display different image based on theme mode
              child: Image.asset(
                isDarkMode ? "images/inst1.png" : "images/inst.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: hompagestoris(),
              ),
              Container(
                child: HompageInstagramPost(),
                height: 550,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
