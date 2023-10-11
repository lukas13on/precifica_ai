// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetalhePage extends StatefulWidget {
  Map<String, dynamic> foto;

  final List<Widget> items = [
    Image.asset('images/iphone3.jpg'),
    Image.asset('images/iphone4.jpg'),
    Image.asset('images/iphone2.jpg'),
    Image.asset('images/iphone3.jpg'),
    Image.asset('images/iphone4.jpg'),
    Image.asset('images/iphone2.jpg'),
    Image.asset('images/iphone3.jpg'),
    Image.asset('images/iphone4.jpg'),
    Image.asset('images/iphone2.jpg'),
    Image.asset('images/iphone3.jpg'),
    Image.asset('images/iphone4.jpg'),
    Image.asset('images/iphone2.jpg'),
    Image.asset('images/iphone3.jpg'),
    Image.asset('images/iphone4.jpg'),
    Image.asset('images/iphone2.jpg'),
    Image.asset('images/iphone3.jpg'),
    Image.asset('images/iphone4.jpg'),
    Image.asset('images/iphone2.jpg'),
    Image.asset('images/iphone3.jpg'),
    Image.asset('images/iphone4.jpg'),
    Image.asset('images/iphone2.jpg'),
  ];

  DetalhePage({Key? key, required this.foto}) : super(key: key);

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foto['title']),
      ),
      body: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: const Color.fromARGB(255, 49, 47, 47),
                  width: 2.0), // Define a borda do Container.
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 32, 31, 31), // Cor da sombra.
                  blurRadius: 10.0, // Raio de desfoque da sombra.
                  spreadRadius: 1.0, // Espalhamento da sombra.
                  offset: Offset(
                      0, 2), // Deslocamento da sombra (horizontal, vertical).
                ),
              ],
            ),
            child: Card(
              borderOnForeground: true,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.foto['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 300,
                      width: 400,
                      child: Image.asset('assets/images/iphone3.jpg')),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Descrição do Produto: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                    child: Text(
                      'R\$ 99.99',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                        ),
                        onPressed: toggleFavorite,
                      )
                    ],
                  ),
                ],
              ),
            
            ),
          ),
        ),
      ]),
    );
  }
}




  
  





