// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:precifica_ai/components/detalhe_page.dart';
import 'package:cached_network_image/cached_network_image.dart';



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

  

  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  List<String> urlsDasImagens = [
    'https://images.unsplash.com/photo-1616348436168-de43ad0db179?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1981&q=80',
    'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1780&q=80',
    'https://images.unsplash.com/photo-1611791484670-ce19b801d192?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
    // Adicione mais URLs de imagens conforme necessário.
  ];

  List<String> names = [
    'iPhone 13 Pro Max',
    'iPhone 13 Pro',
    'iPhone 13 Mini',
    'iPhone 13',
    'iPhone 12 Pro Max',
    'iPhone 12 Pro',
    'iPhone 12 Mini',
    'iPhone 12',
    'iPhone 11 Pro Max',
    'iPhone 11 Pro',
    'iPhone 11',
    'iPhone SE (2ª geração)',
    'iPhone XR',
    'iPhone XS Max',
    'iPhone XS',
    'iPhone X',
    'iPhone 8 Plus',
    'iPhone 8',
    'iPhone 7 Plus',
    'iPhone 7',
    'iPhone 6s Plus',
    'iPhone 6s',
    'iPhone 6 Plus',
    'iPhone 6',
    'iPhone SE (1ª geração)',
    'iPhone 5s',
    'iPhone 5c',
    'iPhone 5',
    'iPhone 4s',
    'iPhone 4',
    'iPhone 3GS',
    'iPhone 3G',
    'iPhone (1ª geração)',
  ];


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
              return Container(
                child: GridView.builder(
                  padding:
                      EdgeInsets.only(
                      top: 0, left: 160, right: 160, bottom: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1,
                   
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
                        width: double.infinity,
                        height: double.infinity,
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.all(2),
                              child: Text(names[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 200,
                              decoration:
                                  BoxDecoration(border: Border.all(width: 0.5)),
                              width: double.maxFinite,
                              child: ListView(
                                children: urlsDasImagens.map((url) {
                                  return Card(
                                    child: CachedNetworkImage(
                                      imageUrl: url,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    'R\$ 15.000,00',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    alignment: AlignmentDirectional.topCenter,
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite ? Colors.red : null,
                                    ),
                                    onPressed: toggleFavorite,
                                  ),
                                ],
                              ),
                            ),
                                
                          ],
                        )
                          ,
                      ),
                      
                    );
                  },
                ),
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
