import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Tools extends StatefulWidget{
  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final titles = ['Hand Washing Timer','Corona Near Me'];
    final icons = [Icons.ac_unit, Icons.access_alarm];
    final List<Widget> screens = [WashingHands(), CoronaNearMe()];
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index){
        return Card(
            child: ListTile(
              leading: Icon(icons[index]),
            title: Text(titles[index]),
              onTap:(){
                Navigator.push(context, new MaterialPageRoute(
                builder: (context) => screens.elementAt(index),
                ));
              },
            ),
        );
      },
    );
  }
}


class CoronaNearMe extends StatefulWidget{
  @override
  _CoronaNearMeState createState() => _CoronaNearMeState();
}

class _CoronaNearMeState extends State<CoronaNearMe>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Corona Near Me'),
      ),
    );
  }
  }




class WashingHands extends StatefulWidget{
  @override
  WashingHandsState createState() => WashingHandsState();
}

class WashingHandsState extends State<WashingHands>{
  @override
  int _counter = 20;
Timer _timer;
void _startTimer(){
_counter = 20;
if(_timer!=null){
  _timer.cancel();
}
_timer = Timer.periodic(Duration(seconds: 1), (timer) {
  setState(() {
    if(_counter>0) {
      _counter--;
    }
    else{
      _timer.cancel();
    }
  });
});
}
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Washing Hands Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (_counter > 0)? Text("") : Text("Finished!", style: TextStyle(color:Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 70,),),
            Text(
            '$_counter',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.normal,
                  fontSize: 40,
                ),
            ),
            RaisedButton(
              onPressed: ()=>_startTimer(),
              child: Text(
                  'Start',
                style: GoogleFonts.lato(
                fontWeight: FontWeight.normal,
                fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





