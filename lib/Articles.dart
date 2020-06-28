import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  Articles({Key key, this.articleSource, this.articleBody}) : super(key: key);
  final String articleSource;
  final String articleBody;

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Text(widget.articleSource),
            Text(widget.articleBody),
          ],
        ),
      ),
    );
  }
}
