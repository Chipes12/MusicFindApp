import 'package:flutter/material.dart';
import 'escuchar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicFindApp ',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Color.fromARGB(96, 62, 62, 66),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Color.fromARGB(245, 245, 245, 255),
              )),
      initialRoute: "/escuchar",
      routes: {"/escuchar": (context) => Escuchar()},
    );
  }
}
