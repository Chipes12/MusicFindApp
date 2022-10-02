import 'package:MusicFindApp/here_you_go.dart';
import 'package:MusicFindApp/providers/SongIdentifierProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteItem extends StatelessWidget {
  final dynamic song;
  const FavoriteItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        height: 325,
        width: 300,
        child: MaterialButton(
          onPressed: () {
            context.read<SongIdentifier>().setSelectedSong(song);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HereYouGo()));
          },
          child: Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child:
                  Image.network(song["spotify"]["album"]["images"][1]["url"], fit: BoxFit.fill,),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: IconButton(
                onPressed: () {
                  if (context.read<SongIdentifier>().getSongsList.contains(
                      context.read<SongIdentifier>().getSelectedSong)) {
                    showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: Text("Eliminar de favoritos"),
                          content: Text(
                              "Quieres quitar esta canción de tus favoritos"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancelar"),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<SongIdentifier>().removeSong(
                                    context
                                        .read<SongIdentifier>()
                                        .getSelectedSong);
                                Navigator.of(context).pop();
                              },
                              child: Text("Eliminar"),
                            ),
                          ],
                        );
                      }),
                    );
                  }
                },
                icon: Icon(Icons.favorite),
              ),
            ),
            Positioned.fill(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: 300,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 149, 243, 0.452),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(children: [
                    Text(
                      "${song["title"]}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${song["artist"]}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ]),
                ))
          ]),
        ));
  }
}
