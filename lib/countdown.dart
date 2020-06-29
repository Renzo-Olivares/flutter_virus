import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class WashingHands extends StatefulWidget {
  @override
  _WashingHandsState createState() => _WashingHandsState();
}

class _WashingHandsState extends State<WashingHands> {
  int _counter = 20;
  Timer _timer;
  bool timerEnabled = false;

  void _startTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          timerEnabled = true;
          if (_counter > 0) {
            _counter--;
          } else {
            _timer.cancel();
          }
        });
      });
    }
  }

  void _resetTimer() {
    setState(() {
      _timer.cancel();
      _counter = 20;
      _timer = null;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Hand Washing Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (_counter > 0)
                ? Text(
                    "Well Done",
                    style: GoogleFonts.lato(
                      color: Colors.transparent,
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                    ),
                  )
                : Text(
                    "Well Done",
                    style: GoogleFonts.lato(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                    ),
                  ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360.0),
                  border: Border.all(
                    width: 6,
                    color: Theme.of(context).accentColor,
                  )),
              child: Center(
                child: Text(
                  '$_counter',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.normal,
                    fontSize: 60,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  onPressed: _timer != null ? null : () => _startTimer(),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'START',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () => _resetTimer(),
                  child: Text(
                    'RESET',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
