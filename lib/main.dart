import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_screen.dart';

void main() {
  return runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('ar', 'EG'),
    ],
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      primarySwatch: Colors.lightGreen,
    ),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text("حاسبة العمر",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black))),
        body: HomeScreen()),
  ));
}
