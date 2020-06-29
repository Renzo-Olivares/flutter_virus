import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      'Going to essential businesses',
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

    final List<Widget> screens = [
      StayingHome(),
      PublicGatherings(),
      EssentialBusiness(),
      InteractingCustomers(),
      Friends(),
      ExerciseOutside(),
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Masks Guide'),
      ),
      body: Center(
        child: GridView.builder(
          itemCount: 6,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(icons2[index]),
                title: Text(titles2[index]),
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
        ),
      ),
    );
  }
}

class StayingHome extends StatefulWidget {
  @override
  _StayingHome createState() => _StayingHome();
}

class _StayingHome extends State<StayingHome>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Staying at home'),
      ),
    );
  }
}

class PublicGatherings extends StatefulWidget {
  @override
  _PublicGatherings createState() => _PublicGatherings();
}

class _PublicGatherings extends State<PublicGatherings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Public Gatherings'),
      ),
    );
  }
}

class EssentialBusiness extends StatefulWidget {
  @override
  _EssentialBusiness createState() => _EssentialBusiness();
}

class _EssentialBusiness extends State<EssentialBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Essential Businesses'),
      ),
    );
  }
}

class InteractingCustomers extends StatefulWidget {
  @override
  _InteractingCustomers createState() => _InteractingCustomers();
}

class _InteractingCustomers extends State<InteractingCustomers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Interacting with people'),
      ),
    );
  }
}

class Friends extends StatefulWidget {
  @override
  _Friends createState() => _Friends();
}

class _Friends extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Hanging out with friends'),
      ),
    );
  }
}

class ExerciseOutside extends StatefulWidget {
  @override
  _ExerciseOutside createState() => _ExerciseOutside();
}

class _ExerciseOutside extends State<ExerciseOutside> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Exercising Outside'),
      ),
    );
  }
}
