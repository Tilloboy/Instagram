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
  ];

  List<bool> isFavoritedList = [];
  List<bool> isBookmarkedList = [];
  List<List<String>> commentsList = [];
  List<bool> showLikeAnimation = []; // To control the like animation display

  @override
  void initState() {
    super.initState();
    isFavoritedList = List<bool>.filled(post.length, false);
    isBookmarkedList = List<bool>.filled(post.length, false);
    commentsList = List<List<String>>.filled(post.length, []);
    showLikeAnimation = List<bool>.filled(post.length, false); // Initialize animation list
  }

  void _toggleFavorite(int index) {
    setState(() {
      isFavoritedList[index] = !isFavoritedList[index];
      if (isFavoritedList[index]) {
        showLikeAnimation[index] = true; // Show the like animation
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            showLikeAnimation[index] = false; // Hide the like animation after 1 second
          });
        });
      }
    });
  }

  void _toggleBookmark(int index) {
    setState(() {
      isBookmarkedList[index] = !isBookmarkedList[index];
    });
  }

  void _addComment(int index, String comment) {
    setState(() {
      commentsList[index].insert(0, comment); // Insert comment at the top
    });
  }

  // Open chat in a modal bottom sheet
  void _openChatScreen(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.lightBlue[50], // Set light shade color for modal
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7, // 70% height
          child: ChatScreen(
            index: index,
            comments: commentsList[index],
            addComment: (comment) {
              _addComment(index, comment);
            },
          ),
        );
      },
    );
  }

  Widget postmap(a postItem, int index) {
    return GestureDetector(
      onDoubleTap: () => _toggleFavorite(index), // Double tap to like
      child: Container(
        width: double.infinity,
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(postItem.rasm!),
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
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    postItem.rasm!,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  if (showLikeAnimation[index]) // Show like animation if active
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 100,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        iconSize: 25,
                        icon: Icon(
                          isFavoritedList[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavoritedList[index] ? Colors.red : Colors.black,
                        ),
                        onPressed: () => _toggleFavorite(index),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.chat_bubble_outline),
                        onPressed: () => _openChatScreen(index), // Open chat screen
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.send),
                    ],
                  ),
                  IconButton(
                    iconSize: 30,
                    icon: Icon(
                      isBookmarkedList[index]
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: Colors.black,
                    ),
                    onPressed: () => _toggleBookmark(index),
                  ),
                ],
              ),
            ),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: post.length,
      itemBuilder: (context, index) {
        a postItem = post[index];
        return postmap(postItem, index);
      },
    );
  }
}

// New ChatScreen to display comments and add new comments
class ChatScreen extends StatefulWidget {
  final int index;
  final List<String> comments;
  final Function(String) addComment;

  const ChatScreen({
    Key? key,
    required this.index,
    required this.comments,
    required this.addComment,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _commentController = TextEditingController();
  bool _showEmojiPanel = false; // Flag to show/hide emoji panel

  // List of emojis to add
  List<String> emojis = [
    '😊', '❤️', '👍', '😂', '🎉', '😍', '😢', '😎', '🥳', '💔',
    '✨', '💯', '🙏', '😱', '💖', '🔥', '💃', '🐶', '🐱', '🌹',
    '🌈', '🍕', '🍔', '🥗', '🍦', '🍰', '🍉', '🌻', '🎈', '🎂',
    '🚀', '🏆', '🎤', '🕺', '🤗', '😇', '😈', '🥺', '🤩', '🥰',
    '🤓', '😷', '🤖', '👻', '💀', '☀️', '🌧️', '🌕', '🎃', '🦄'
  ];

  void _toggleEmojiPanel() {
    setState(() {
      _showEmojiPanel = !_showEmojiPanel; // Toggle emoji panel visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Column(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('images/78.jpg'), // Update with your profile image path
                      ),
                      Text(
                        "G.B.M.R",
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  title: Text(widget.comments[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "Add a comment... (use emojis)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.multiline, // Allow multiline input
                    maxLines: null, // Allow unlimited lines for comments
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      widget.addComment(_commentController.text); // Add the comment
                      _commentController.clear(); // Clear input field
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.emoji_emotions), // Emoji button
                  onPressed: _toggleEmojiPanel,
                ),
              ],
            ),
          ),
          // Emoji Panel
          if (_showEmojiPanel) // Show emoji panel if flag is true
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: emojis.map((emoji) {
                  return GestureDetector(
                    onTap: () {
                      _commentController.text += emoji; // Add emoji to text field
                    },
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: 24), // Adjust the size of the emoji
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class a {
  String? rasm;
  String? nom;
  String? commit;
  a({this.nom, this.rasm, this.commit});
}
