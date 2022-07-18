import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zooan'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: List.generate(5, (i) => Text('I am a chosen one $i')),)
      ),
    );
  }
}