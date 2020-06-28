import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class LoginFlow extends StatefulWidget {
  @override
  _LoginFlowState createState() => _LoginFlowState();
}

class _LoginFlowState extends State<LoginFlow> {
  int _flowIndex = 0;

  List<Widget> _flowPages = [
    _SignIn(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Expanded(
                child: PageTransitionSwitcher(
                  duration: Duration(milliseconds: 300),
                  reverse: false,
                  transitionBuilder: (Widget child, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return SharedAxisTransition(
                      child: child,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                  },
                  child: _flowPages.elementAt(_flowIndex),
                ),
              ),
              ButtonBar(
                children: [
                  FlatButton(
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_flowIndex == 0) {
                          Navigator.pop(context);
                        } else {
                          _flowIndex = _flowIndex - 1;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: 180.0,
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('NEXT'),
                    onPressed: () {
                      setState(() {
                        if (_flowIndex == _flowPages.length - 1) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                        title: 'Home',
                                      )),
                              (Route route) => false);
                        } else {
                          _flowIndex = _flowIndex + 1;
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        SizedBox(height: 40.0),
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 56.0,
        ),
        SizedBox(height: 140.0),
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
