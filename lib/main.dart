import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:precifica_ai/components/bottonsheet.dart';
import 'package:precifica_ai/pages/cadastro_produtos.dart';
import 'package:precifica_ai/components/carousel.dart';
import 'package:precifica_ai/components/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:precifica_ai/components/product_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        title: 'Precifica.Aí',
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
    height: 250.0,
    aspectRatio: 16 / 9,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    enlargeCenterPage: true,
    enableInfiniteScroll: true,
    viewportFraction: 0.30,
  );

  static Widget _buildImageWidget(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
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
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        actions: [
          Container(
            padding: EdgeInsets.all(8),
            height: 400,
            width: 500,
            alignment: Alignment.center,
            child: SearchBar(
              textStyle: MaterialStatePropertyAll(
                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 255, 255, 255),
              ),
              hintText: 'Pesquisar',
              hintStyle: MaterialStatePropertyAll(
                TextStyle(color: Color.fromARGB(2, 0, 0, 0)),
              ),
              onSubmitted: (String value) {
                print('Submitted: $value');
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          )
        ],
        title: Text(
          widget.title,
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 49, 46, 46),
                    blurRadius: 100.0,
                    spreadRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: MyCarousel(
                items: items,
                carouselOptions: carouselOptions,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.maxFinite,
              height: 3000,
              child: ProductGridView(),
            ),
          ],
        ),
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
            ),
          ),
        ),
      ),
    );
  }
}
