import 'package:bookapiflutter/screens/add_screen.dart';
import 'package:bookapiflutter/screens/detail_screen.dart';
import 'package:bookapiflutter/screens/update_screen.dart';
import 'package:bookapiflutter/res/constants.dart';
import 'package:bookapiflutter/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_life_cycle/page_life_cycle.dart'
    show PageNavigatorObserver;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: colorPrimary,
        primaryColorDark: colorPrimaryDark,
        accentColor: colorAccent,
      ),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        AddScreen.id: (context) => AddScreen(),
        DetailScreen.id: (context) => DetailScreen(),
        UpdateScreen.id: (context) => UpdateScreen()
      },
      navigatorObservers: [PageNavigatorObserver()],
    );
  }
}
