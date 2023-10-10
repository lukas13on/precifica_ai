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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foto['title']),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Expanded(
            child: ListView(
              children: [
                Image.network(widget.foto['url']),
                Text(widget.foto['title'])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
