import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flip_card/flip_card.dart';
import 'countdown.dart';

class Tools extends StatefulWidget {
  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final titles = ['Hand Washing Timer', 'Mask Guidelines'];
    final icons = [MdiIcons.timerOutline, MdiIcons.guyFawkesMask];
    final List<Widget> screens = [WashingHands(), MasksGuide()];
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(titles[index]),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => screens.elementAt(index),
                  ));
            },
          ),
        );
      },
    );
  }
}

class MasksGuide extends StatefulWidget {
  @override
  _MasksGuide createState() => _MasksGuide();
}

class _MasksGuide extends State<MasksGuide> {
  @override
  Widget build(BuildContext context) {
    final titles2 = [
      'Staying at home',
      'At or going to a place of public gatherings',
      'Going to essential business',
      'Interacting with customers, clients, or coworkers',
      'Hanging out with friends',
      'Exercising Outside'
    ];

    final icons2 = [
      Icons.ac_unit,
      Icons.access_alarm,
      Icons.airline_seat_flat,
      Icons.add_circle,
      Icons.airport_shuttle,
      Icons.beach_access
    ];

    final answers = [
      "Yes, you should be fine without a mask",
      "You should be wearing a mask when going out to places with large amounts of people close by",
      "Yes, you should be wearing a mask even if you are just going to the grocery store. Any essential business requires you to have a mask inside",
      "Yes, when interacting with others wear a mask",
      "Even though they are you're friends you should still have a mask on, so you guys do not spread anything to each other",
      "Bring a mask with you, but if you are in a highly populated area with lots of people outside then you should wear a mask",
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Masks Guidelines'),
      ),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 6,
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 200,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      leading: Icon(icons2[index]),
                      title: Text(titles2[index]),
                    ),
                  ],
                ),
              ),
              back: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 6,
                      color: Theme.of(context).accentColor,
                    )),
                height: 200.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(answers[index]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
