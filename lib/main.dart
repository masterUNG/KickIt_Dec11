import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/appss.dart';
import 'scaffold/splash_screen.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData(primarySwatch: Colors.green),
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/KickItAppss': (BuildContext context) => CustomAppBarDemo()
    },
  ));
}
