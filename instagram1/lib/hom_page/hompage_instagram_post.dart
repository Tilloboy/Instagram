import 'package:flutter/material.dart';

class HompageInstagramPost extends StatefulWidget {
  const HompageInstagramPost({super.key});

  @override
  State<HompageInstagramPost> createState() => _HompageInstagramPostState();
}

class _HompageInstagramPostState extends State<HompageInstagramPost> {

List post =[
 a(
      rasm: "images/1.jpg",
      nom: "Rengo_ku",
    ),
];

Widget postmap (a){
  return Container(width: 350,
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
                  backgroundImage: AssetImage(
                     a.rasm ), // Your profile image URL
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      a.nom,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Tokyo, Japan'),
                  ],
                ),
              ],
            ),
          ),
          // Post Image
          Image.asset(
            a.rasm,// Your post image URL
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          // Post Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 10),
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 10),
                    Icon(Icons.send),
                  ],
                ),
                Icon(Icons.bookmark_border),
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
                  'Liked by craig_love and 44,686 others',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'joshua_l ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'The game in Japan was amazing and I want to share some photos'),
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
    return ListView(
      children: post.map((e) => postmap(e),).toList(),
    );
  }
}

class a {
  String? rasm;
  String? nom;
  String? commit;
  a({this.nom, this.rasm,this.commit});
}