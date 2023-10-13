import 'package:flutter/material.dart';

class BottomNavBarFb5 extends StatelessWidget {
  const BottomNavBarFb5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Matheus Schuch',
        style: TextStyle(
          fontSize: 12,
          height: .1,
          color: Colors.white,
        ),
      ),
    ],
  );
}
