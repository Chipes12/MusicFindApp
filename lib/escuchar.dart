import 'package:flutter/material.dart';

class Escuchar extends StatelessWidget {
  
  const Escuchar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(height: 40),
        Center(
            child: Text("Toque para escuchar", style: TextStyle(fontSize: 20))),
        SizedBox(height: 150),
        Center(
            child: RawMaterialButton(
          onPressed: () {},
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/música.png"),
            radius: 90,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        )),
        SizedBox(height: 100),
        Center(
          child: IconButton(
            color: Color.fromARGB(245, 245, 245, 255),
            iconSize: 20,
            icon: Icon(Icons.favorite, color: Colors.black),
            onPressed: (){},
          ),
        ),
        Expanded(child: SizedBox(height: 40))
      ],
    ));
  }
}
