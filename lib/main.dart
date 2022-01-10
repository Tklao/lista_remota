// ignore_for_file: prefer_const_constructors
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:lista_remota/user.dart';
import 'dart:convert';
import 'api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var users = <Usuarios>[];

  _getUsers() {
    API.getUsers().then(
      (response) {
        setState(() {
          Iterable lista = json.decode(response.body);
          users = lista.map((model) => Usuarios.fromJson(model)).toList();
          developer.inspect(lista);
        });
      },
    );
  }

  _MyHomePageState() {
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: listaUsuario(),
    );
  }

  listaUsuario() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
              trailing: Text(users[index].id.toString()),
            ));
  }
}
