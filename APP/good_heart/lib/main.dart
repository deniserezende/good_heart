import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'colors.dart';
import 'home_page.dart';
import 'connection_page.dart';
import 'evaluation_page.dart';
import 'settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MyColors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (_) => DefaultHomePage(),
        '/connection_page': (_) => ConnectionPage(),
        '/evaluation_page': (_) => Evaluation(),
        '/settings_page': (_) => SettingsPage(),
      }
    );
  }
}
