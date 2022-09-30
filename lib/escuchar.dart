import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
//import 'providers/recognize.dart';

class Escuchar extends StatefulWidget {
  const Escuchar({
    Key? key,
  }) : super(key: key);

  @override
  State<Escuchar> createState() => _EscucharState();
}

class _EscucharState extends State<Escuchar> {
  bool animacion = false;
  List<String> mensajes = ["Toque para escuchar", "Escuchando"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(height: 40),
        Center(
            child: Text(animacion ? mensajes[1] : mensajes[0],
                style: TextStyle(fontSize: 20))),
        SizedBox(height: 150),
        Center(
            child: AvatarGlow(
          animate: animacion,
          repeat: true,
          endRadius: 80.0,
          glowColor: Colors.purpleAccent,
          child: MaterialButton(
            onPressed: () {
              animacion = !animacion;
              Timer(Duration(seconds: 4), () {
                animacion = !animacion;
              });
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/música.png"),
              radius: 90,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        )),
        SizedBox(height: 100),
        Center(
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(245, 245, 245, 255),
            child: IconButton(
              iconSize: 20,
              icon: Icon(Icons.favorite, color: Colors.black),
              onPressed: () {},
              tooltip: "Ver favoritos",
            ),
          ),
        ),
      ],
    ));
  }
}
