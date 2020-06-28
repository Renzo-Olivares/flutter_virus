import 'package:flutter/material.dart';
import 'package:fluttervirus/login.dart';

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
              'Welcome to Flutter Virus',
              style: Theme.of(context).textTheme.headline5,
            )),
            SizedBox(height: 3.0),
            Center(
              child: Text(
                'Keep up to date with everything corona',
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
                  child: Text("CREATE"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                ),
                SizedBox(
                  width: 0.0,
                ),
                RaisedButton(
                  child: Text('SIGN IN'),
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginFlow()));
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
