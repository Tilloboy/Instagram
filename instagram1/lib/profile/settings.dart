import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/theme/theme_provired.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool a = true; // "open/closed account" holatini saqlovchi

  void n() {
    setState(() {
      a = !a; // Tugmachaning holatini o'zgartirib beradi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("S E T T I N G S")),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T H E M E"),
                    CupertinoSwitch(
                      value: Provider.of<ThemeProvired>(context, listen: false)
                          .isDarkmoode,
                      onChanged: (value) =>
                          Provider.of<ThemeProvired>(context, listen: false)
                              .toogleTheme(),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Holatiga qarab matnni ko'rsatish
                    Text(a ? "O P E N  A C C O U N T" : "C L O S E D  A C C O U N T"),
                    CupertinoSwitch(
                      value: a, // Holatni ko'rsatadi
                      onChanged: (value) {
                        n(); // Tugma bosilganda holatni o'zgartiradi
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
