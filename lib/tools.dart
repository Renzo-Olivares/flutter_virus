import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'tools/countdown.dart';
import 'tools/maskguide.dart';

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
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: OpenContainer(
            transitionDuration: Duration(milliseconds: 400),
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (BuildContext context, VoidCallback _) {
              return screens.elementAt(index);
            },
            closedElevation: 8.0,
            closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            closedColor: Theme.of(context).accentColor,
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return Card(
                child: ListTile(
                  leading: Icon(icons[index]),
                  title: Text(
                    titles[index],
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
