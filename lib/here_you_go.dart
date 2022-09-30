import 'package:flutter/material.dart';

class HereYouGo extends StatelessWidget {
  //final dynamic cancion;
  //final bool favorita;
  const HereYouGo({
    Key? key,
    //required this.cancion,
   // required this.favorita,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(96, 62, 62, 66),
        title: Text("Here you go"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.favorite),
              )),
        ],
      ),
      body: ListView(
        children: [
          Image.network("https://i.scdn.co/image/d3acaeb069f37d8e257221f7224c813c5fa6024e"),
          SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text("Titulo", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("Album", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                Text("Artista", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey[600]),),
                Text("Fecha", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey[600]),),
                Divider(color: Colors.grey[900],),
                Text("Abrir con:"),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (){} , icon: Icon(Icons.podcasts)),
                      
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
