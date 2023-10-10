// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:precifica_ai/cadastro_produtos.dart';
import 'package:precifica_ai/components/carousel.dart';
import 'package:precifica_ai/components/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:precifica_ai/components/product_card.dart';




void main() {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Precifica.aí Project',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Barra Lateral',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {


final List<Widget> items = [
    _buildImageWidget('images/iphone3.jpg'),
    _buildImageWidget('images/iphone4.jpg'),
    _buildImageWidget('images/iphone2.jpg'),
  ];

  final CarouselOptions carouselOptions = CarouselOptions(
    height: 270.0,
    aspectRatio: 16 / 9,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    enlargeCenterPage: true,
    enableInfiniteScroll: true,
    viewportFraction: 0.40,
  );
  


  static Widget _buildImageWidget(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
          12.0), // Ajuste o valor para a curvatura desejada
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PrincipalMenu.get(context),
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          )
      ),
      
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(

            child: MyCarousel(
              items: items,
              carouselOptions: carouselOptions,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ProductGridView(),
          )
        ],  
        
        
      ),

      
      
      
      floatingActionButton: Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0.5, 0.5),
            ),
          ],
        ),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            elevation: 10,
            child: const Icon(
              Icons.shopping_bag,
              color: Color.fromARGB(255, 203, 154, 5),
              size: 18,
              // shadows: [
              //   Shadow(
              //     color: Colors.black,
              //     offset: Offset(0.2, 0.5),
              //     blurRadius: 5.0,
              //   )
              // ],
            ),
          ),
        ),
      ),
    );
  }
}
