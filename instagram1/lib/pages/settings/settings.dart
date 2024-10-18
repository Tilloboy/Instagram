import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/pages/theme/theme_provired.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("S E T T I N G S")),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        padding: EdgeInsets.all(15),
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
    );
  }
}
