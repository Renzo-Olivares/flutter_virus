import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            SizedBox(height: 150.0),
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 56.0,
            ),
            SizedBox(height: 30.0),
            Center(
                child: Text(
              'Welcome to Flutter Safety',
              style: Theme.of(context).textTheme.headline5,
            )),
            SizedBox(height: 3.0),
            Center(
              child: Text(
                'Keep up to date with everything Coronavirus',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(height: 2.0),
            Center(
              child: Text(
                'Stay safe and healthy!',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(height: 30.0),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text('CONTINUE'),
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
