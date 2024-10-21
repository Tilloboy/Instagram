import 'package:flutter/material.dart';

class HompageInstagramPost extends StatefulWidget {
  const HompageInstagramPost({super.key});

  @override
  State<HompageInstagramPost> createState() => _HompageInstagramPostState();
}

class _HompageInstagramPostState extends State<HompageInstagramPost> {
  List<a> post = [
    a(
      rasm: "images/1.jpg",
      nom: "Rengo_ku",
      commit:
          "Liked by craig_love and 44,686 others\n The game in Japan was amazing and I want to share some photos",
    ),
    a(
      rasm: "images/2.jpg",
      nom: "tan_jiro",
      commit:
          "Liked by craig_love and 3,386 others\n NeverScrollableScrollPhysics to ensure",
    ),
    // Add more posts if necessary
  ];

  // Lists to track the state of each post's favorite and bookmark icons
  List<bool> isFavoritedList = [];
  List<bool> isBookmarkedList = [];

  @override
  void initState() {
    super.initState();
    // Initialize all posts with non-favorited and non-bookmarked states
    isFavoritedList = List<bool>.filled(post.length, false);
    isBookmarkedList = List<bool>.filled(post.length, false);
  }

  // Function to toggle heart color for a specific post
  void _toggleFavorite(int index) {
    setState(() {
      isFavoritedList[index] = !isFavoritedList[index]; // Toggle the state
    });
  }

  // Function to toggle bookmark icon for a specific post
  void _toggleBookmark(int index) {
    setState(() {
      isBookmarkedList[index] = !isBookmarkedList[index]; // Toggle the state
    });
  }

  Widget postmap(a postItem, int index) {
    return Container(
      width: double.infinity,
      height: 550,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(postItem.rasm!), // Your profile image URL
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postItem.nom!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Tokyo, Japan'),
                  ],
                ),
              ],
            ),
          ),
          // Post Image
          Center(
            child: Container(width: 400,
              child: Image.asset(
                postItem.rasm!, // Your post image URL
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Post Actions
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
                            ? Icons.favorite
                            : Icons.favorite_border, // Toggle between filled and border heart
                        color: isFavoritedList[index] ? Colors.red : Colors.black, // Change color when tapped
                      ),
                      onPressed: () => _toggleFavorite(index), // Call the toggle function on tap
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 10),
                    Icon(Icons.send),
                  ],
                ),
                IconButton(
                  iconSize: 30, // Set icon size
                  icon: Icon(
                    isBookmarkedList[index]
                        ? Icons.bookmark
                        : Icons.bookmark_border, // Toggle between filled and border bookmark
                    color: Colors.black, // Change color when tapped
                  ),
                  onPressed: () => _toggleBookmark(index), // Call the toggle function on tap
                ),
              ],
            ),
          ),
          // Like and Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postItem.commit!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: postItem.nom!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(), // This disables inner scrolling for the posts
      shrinkWrap: true,
      itemCount: post.length, // Use the length of the post list
      itemBuilder: (context, index) {
        a postItem = post[index];
        return postmap(postItem, index); // Build each post
      },
    );
  }
}

class a {
  String? rasm;
  String? nom;
  String? commit;
  a({this.nom, this.rasm, this.commit});
}
