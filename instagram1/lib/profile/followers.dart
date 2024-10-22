import 'package:flutter/material.dart';
import 'dart:math';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Your subscribers')),
        ),
        body: RandomUsersList(),
      
    );
  }
}

class RandomUsersList extends StatelessWidget {
  final Random random = Random();
  
  // Haqiqiy nomlar ro'yxati
  final List<String> names = [
    'John Doe', 'Jane Smith', 'Michael Johnson', 'Emily Davis',
    'William Brown', 'Sophia Wilson', 'James Garcia', 'Olivia Martinez',
    'Benjamin Rodriguez', 'Ava Hernandez', 'Lucas Anderson', 'Mia Thomas',
    'Ethan Taylor', 'Charlotte Moore', 'Alexander Jackson', 'Amelia White',
    // Yana boshqa nomlar qo'shishingiz mumkin
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 999, // 999 ta foydalanuvchini ko'rsatish
      itemBuilder: (context, index) {
        // Tasodifiy nom tanlash
        String randomName = names[random.nextInt(names.length)];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/${random.nextInt(100)}.jpg',
            ),
          ),
          title: Text(randomName),
          trailing: ElevatedButton(
            onPressed: () {
              // Tugmachani bosgan holda chop etish
              print('$randomName izdoshlari bor');
            },
            child: Text('Followers'),
          ),
        );
      },
    );
  }
}
