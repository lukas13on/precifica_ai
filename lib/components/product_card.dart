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
          title: Text('Produtos disponivéis:'),
        ),
        body: FutureBuilder<List>(
          future: listaFotos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
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
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 29, 30, 32),
                        border: Border.all(
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView(children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(snapshot.data![index]['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center),
                            SizedBox(height: 20),
                            testeImages[index],
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Valor: 10',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
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
