import 'package:flutter/material.dart';
import 'package:instagram1/pages/Home_page/home_page.dart';
import 'package:instagram1/pages/theme/theme_provired.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvired(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvired>(context).themeData,
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool n = true;
  void h() {
    setState(() {
      n = !n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: n ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  h();
                },
                child: Text(n ? "light mood" : "Dark mood"),
              ),
              Container(width: 150,height: 150,
               color:n?Colors.white:Colors.black, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
