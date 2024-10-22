import 'package:flutter/material.dart';
import 'package:instagram1/hom_page/messages/messGER_LIST.DART';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 1,
        title: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            onChanged: (text) {
              // Qidiruv funksiyasi
              setState(() {
                // Filtrlash yoki qidirish natijalarini yangilash
                // Hozircha bo'sh, lekin siz bu yerga qidiruv mexanizmini qo'shishingiz mumkin
              });
            },
          ),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  child: listmessg(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Your contacts",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Theme",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
