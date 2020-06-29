import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      MdiIcons.homeVariantOutline,
      MdiIcons.accountSupervisorOutline,
      MdiIcons.domain,
      MdiIcons.faceAgent,
      MdiIcons.foodForkDrink,
      MdiIcons.runFast
    ];

    final answers = [
      "You should be fine without a mask.",
      "You should be wearing a mask when going out to places with large amounts of people close by.",
      "You should be wearing a mask when going to any public place.",
      "Yes, when interacting with others wear a mask.",
      "Even though they are your friends you should still have a mask on, so you guys do not spread anything to each other.",
      "Bring a mask with you, but if you are in a highly populated area with lots of people outside then you should wear a mask.",
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Masks Guidelines'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(4.0),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: Material(
                elevation: 8.0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: Theme.of(context).accentColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
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
              ),
              back: Material(
                elevation: 8.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      border: Border.all(
                        width: 5,
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
            ),
          );
        },
      ),
    );
  }
}
