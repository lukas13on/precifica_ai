// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:precifica_ai/components/detalhe_page.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridView();
}

class _ProductGridView extends State<ProductGridView> {
  late Future<List> listaFotos;
  @override
  void initState() {
    super.initState();
    listaFotos = pegarFotos();
  }

  final List testeImages = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Precifica AÍ!',
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 64, 62, 62), // Cor da sombra
                      offset: Offset(3,
                          3), // Deslocamento da sombra (horizontal, vertical)
                      blurRadius: 5, // Raio de desfoque da sombra
                    ),
                  ],
                  color: Color.fromARGB(255, 167, 159, 159),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List>(
          future: listaFotos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding:
                    EdgeInsets.only(top: 0, left: 180, right: 180, bottom: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: 1,
                  mainAxisExtent: 300,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetalhePage(foto: snapshot.data![index]),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 29, 30, 32),
                        border: Border.all(
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(
                                255, 26, 24, 24), // Cor da sombra
                            offset: Offset(0,
                                4), // Deslocamento da sombra (horizontal, vertical)
                            blurRadius: 10, // Raio de desfoque da sombra
                            spreadRadius: 0, // Espalhamento da sombra
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView(children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              child: Text(snapshot.data![index]['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                            SizedBox(height: 20),
                            testeImages[index],
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                              'Valor: 10',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                                  ),
                                ]),
                          ],
                        )
                      ]),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar dados'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Future<List> pegarFotos() async {
    var url =
        Uri.parse('https://jsonplaceholder.typicode.com/photos?_limit=20');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body).map((foto) => foto).toList();
    }
    throw Exception('Erro ao carregar fotos');
  }
}
