import 'package:MusicFindApp/here_you_go.dart';
import 'package:flutter/material.dart';
import 'escuchar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicFindApp ',
      theme: new ThemeData.dark(),
      initialRoute: "/escuchar",
      routes: {"/escuchar": (context) => Escuchar()},
    );
  }
}
