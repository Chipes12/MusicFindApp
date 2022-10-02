import 'package:MusicFindApp/escuchar.dart';

import 'providers/SongIdentifierProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(ChangeNotifierProvider(
        create: (context) => SongIdentifier(),
        child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicFindApp ',
      theme: new ThemeData.dark(),
      home: Escuchar(),
    );
  }
}
