// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:precifica_ai/pages/cadastro_produtos.dart';

class PrincipalMenu {
  static Drawer get(context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Matheus Henrique Schuch'),
            accountEmail: Text('matheus@email.com'),
            currentAccountPicture: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/user.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página inicial'),
            subtitle: Text('Início'),
            trailing: Icon(Icons.new_label),
          ),
          ListTile(
              leading: Icon(Icons.list),
              title: Text('Produtos'),
              subtitle: Text('Todos os produtos'),
              trailing: Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cadastroTrf()),
                );
              }),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Favoritos'),
            subtitle: Text('Meus favoritos'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Visualize suas tarefas...'),
            subtitle: Text('Tasks'),
            trailing: Icon(Icons.burst_mode),
          ),
          ListTile(
            leading: Icon(Icons.task_sharp),
            title: Text('Adicionar Novas Tarefas...'),
            subtitle: Text('+ Tasks'),
            trailing: Icon(Icons.task_alt),
          )
        ],
      ),
    );
  }
}
