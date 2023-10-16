// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:precifica_ai/components/product_card.dart';

class DetalhePage extends StatefulWidget {
  final Produtos produto;

  DetalhePage({required this.produto});


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
        title: Text(widget.produto.name),
      ),
      body: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            width: 500,
            height: 500,
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
                    widget.produto.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 300,
                  width: double.maxFinite,
                  child: CachedNetworkImage(
                    imageUrl: widget.produto.url,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Descrição do Produto: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                            EdgeInsets.fromLTRB(10, 1, 0, 1),
                      child: Text(
                        'R\$ ${widget.produto.preco}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(280, 1, 0, 1),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart_outlined),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                        ),
                        onPressed: toggleFavorite,
                      ),
                    )
                    ],
                  
                  
                    
                  
                  
                  ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
