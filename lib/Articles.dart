import 'package:flutter/material.dart';
import 'Webpract.dart';

class Articles extends StatefulWidget {
  Articles({Key key, this.name}) : super(key: key);
  final String name;
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Virus'),
      ),
      body: SafeArea(
        child: Website(url: widget.name),
      ),
    );
  }
}
