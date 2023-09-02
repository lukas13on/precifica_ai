import 'package:flutter/material.dart';

class cadastroTrf extends StatefulWidget {
  @override
  _cadastroTrfState createState() => _cadastroTrfState();
}

class _cadastroTrfState extends State<cadastroTrf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de tarefas'),
      ),
      body: Column(children: [Text('Cadastro')]),
    );
  }
}
