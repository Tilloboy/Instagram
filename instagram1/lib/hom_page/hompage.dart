import 'package:carousel_slider/carousel_slider.dart';
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
                                  border:
                                      Border.all(color: Colors.white, width: 2),
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
                    child: HomepageStories(),
                  ),
                ),
              
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: HompageInstagramPost(),
                    width: double.infinity,
                  ),
                ),
                Container(
                  child: HompageInstagramPos(),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HompageInstagramPos extends StatefulWidget {
  const HompageInstagramPos({super.key});

  @override
  State<HompageInstagramPos> createState() => _HompageInstagramPosState();
}

class _HompageInstagramPosState extends State<HompageInstagramPos> {
  // List of posts to display, each post is an instance of class 'a'
  List<a> post = [
    a(
      images: [
        "images/1.jpg",
        "images/2.jpg",
        "images/59.jpg",
      ],
      nom: "joshua_l",
      commit: "Liked by craig_love and 44,686 others\n The game in Japan was amazing and I want to share some photos",
      location: "Tokyo, Japan",
    ),
  ];

  int _currentIndex = 0; // Carousel index

  // Heart and Bookmark states
  List<bool> isFavoritedList = [false]; // Track favorite status for each post
  List<bool> isBookmarkedList = [false]; // Track bookmark status for each post

  // Function to toggle heart (favorite)
  void _toggleFavorite(int index) {
    setState(() {
      isFavoritedList[index] = !isFavoritedList[index]; // Toggle favorite status
    });
  }

  // Function to toggle bookmark
  void _toggleBookmark(int index) {
    setState(() {
      isBookmarkedList[index] = !isBookmarkedList[index]; // Toggle bookmark status
    });
  }

  // Method to map each post to a widget
  Widget postmap(a postItem, int index) {
    return Container(
      width: double.infinity,
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile and location section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/profile.jpg"), // Profile image
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postItem.nom!, // Username
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(postItem.location!), // Location
                  ],
                ),
              ],
            ),
          ),
          // Carousel Slider for images
          Stack(
            alignment: Alignment.topCenter,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 400.0, // Height of the carousel
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index; // Update current index on page change
                    });
                  },
                ),
                items: postItem.images!.map((image) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        image, // Load image
                        fit: BoxFit.cover, // Cover the container
                      ),
                    ),
                  );
                }).toList(),
              ),
              // Display current image index in the top right corner
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${_currentIndex + 1}/${postItem.images!.length}", // Current image index
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          // Dots indicator for carousel images
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: postItem.images!.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() {
                  _currentIndex = entry.key; // Update current index on dot tap
                }),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.blueAccent // Active dot color
                        : Colors.grey, // Inactive dot color
                  ),
                ),
              );
            }).toList(),
          ),
          // Like and caption section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      iconSize: 25, // Set icon size
                      icon: Icon(
                        isFavoritedList[index]
                            ? Icons.favorite // Filled heart if favorited
                            : Icons.favorite_border, // Empty heart if not favorited
                        color: isFavoritedList[index] ? Colors.red : Colors.black, // Change color when tapped
                      ),
                      onPressed: () => _toggleFavorite(index), // Call toggle favorite function
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.chat_bubble_outline), // Comment icon
                    SizedBox(width: 10),
                    Icon(Icons.send), // Share icon
                  ],
                ),
                IconButton(
                  iconSize: 30, // Set icon size
                  icon: Icon(
                    isBookmarkedList[index]
                        ? Icons.bookmark // Filled bookmark if bookmarked
                        : Icons.bookmark_border, // Empty bookmark if not bookmarked
                    color: Colors.black, // Bookmark color
                  ),
                  onPressed: () => _toggleBookmark(index), // Call toggle bookmark function
                ),
              ],
            ),
          ),
          // Post caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postItem.commit!,  // Caption of the post
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: postItem.nom!, // Username in caption
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' The game in Japan was amazing and I want to share some photos.'), // Fixed comment text
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Building the list of posts
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disable scrolling of the ListView
      itemCount: post.length, // Number of posts
      itemBuilder: (context, index) {
        return postmap(post[index], index); // Map each post to widget
      },
    );
  }
}

// Class to define the structure of a post
class a {
  String? rasm; // Not used in the current implementation
  String? nom; // Username of the post
  String? commit;  // Caption of the post
  List<String>? images; // List of images in the post
  String? location; // Location of the post

  a({this.nom, this.rasm, this.commit, this.images, this.location}); // Constructor
}
