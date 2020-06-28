import 'package:flutter/material.dart';
import 'Articles.dart';
import 'articleDb.dart';

class Headlines extends StatefulWidget {
  Headlines({Key key}) : super(key: key);
  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
              leading: FlutterLogo(),
              title: Text(article1Title),
              subtitle: Text(article1Subtitle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Articles(
                            articleSource: article1Source,
                            articleBody: article1Body,
                          )),
                );
              }),
        ),
        Card(
          child: ListTile(
              leading: FlutterLogo(),
              title: Text(article2Title),
              subtitle: Text(article2Subtitle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Articles(
                            articleSource: article2Source,
                            articleBody: article2Body,
                          )),
                );
              }),
        ),
        Card(
          child: ListTile(
              leading: FlutterLogo(),
              title: Text(article3Title),
              subtitle: Text(article3Subtitle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Articles(
                            articleSource: article3Source,
                            articleBody: article3Body,
                          )),
                );
              }),
        ),
      ],
    );
  }
}
