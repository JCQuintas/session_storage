import 'package:flutter/material.dart';
import 'package:session_storage/session_storage.dart';

void main() {
  SessionStorage()..addAll({'language': 'english', 'name': 'Session Man'});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = SessionStorage();

    return Column(
      children: [
        Text('User: ${session['name']}'),
        Text('Language: ${session['language']}'),
      ],
    );
  }
}
