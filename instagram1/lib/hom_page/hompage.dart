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
     body: CustomScrollView(
  slivers: [
    SliverAppBar(
      floating: true,
      snap: true,
      expandedHeight: 75.0,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      leading: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: IconButton(
          icon: Icon(CupertinoIcons.camera, size: 30),
          onPressed: () {
            // Camera action
          },
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Instagram',
            style: TextStyle(
              fontFamily: 'insta',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 0),
          child: Row(
            children: [
              IconButton(
                icon: Stack(
                  children: [
                    Icon(Icons.live_tv_sharp, size: 30),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  // IGTV action
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.paperplane, size: 30),
                onPressed: () {
                  // Direct Messenger action
                },
              ),
            ],
          ),
        ),
      ],
    ),

    SliverList(
      delegate: SliverChildListDelegate(
        [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 100,
              child: hompagestoris(),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              child: HompageInstagramPost(),
              width: double.infinity,
            ),
          ),
        ],
      ),
    ),
  ],
),

    );
  }
}
