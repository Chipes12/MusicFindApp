import 'package:MusicFindApp/items/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:MusicFindApp/providers/SongIdentifierProvider.dart';

import 'escuchar.dart';

class Favorites extends StatelessWidget {
  const Favorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(96, 62, 62, 66),
          title: Text("Favorites"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.read<SongIdentifier>().noSelectedSong();
              context.read<SongIdentifier>().notFound();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Escuchar()),
              );
            },
          ),
        ),
        body: ListView.builder(
            itemCount: context.watch<SongIdentifier>().getSongsList.length,
            itemBuilder: (BuildContext context, int index) {
              var _favoriteItem =
                  context.read<SongIdentifier>().getSongsList[index];
              return FavoriteItem(song: _favoriteItem);
            }));
  }
}
