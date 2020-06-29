import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:fluttersafety/charts/barlabelchart.dart';
import 'package:fluttersafety/charts/piechart.dart';
import 'package:fluttersafety/charts/timeserieschart.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  static final List<String> _titles = [
    'Covid Cases by Region',
    'Covid Cases by Country',
    'US Coronavirus Cases',
    'Peru Coronavirus Cases',
    'Italy Coronavirus Cases',
    'UK Coronavirus Cases',
  ];

  List<Widget> _statsPages = [
    StatsPage(
        chart: CoronavirusBarLabelChart.withSampleData(),
        chartTitle: _titles[0]),
    StatsPage(
      chart: CoronavirusPieChart.withSampleData(),
      chartTitle: _titles[1],
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataUs(),
      chartTitle: _titles[2],
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataPeru(),
      chartTitle: _titles[3],
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataItaly(),
      chartTitle: _titles[4],
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataUk(),
      chartTitle: _titles[5],
    )
  ];

  List<Widget> _cardPreviews = [
    CoronavirusBarLabelChart.preview(),
    CoronavirusPieChart.preview(),
    CoronavirusTimeSeriesChart.previewUs(),
    CoronavirusTimeSeriesChart.previewPeru(),
    CoronavirusTimeSeriesChart.previewItaly(),
    CoronavirusTimeSeriesChart.previewUk(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: 6,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: OpenContainer(
              transitionDuration: Duration(milliseconds: 400),
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (BuildContext context, VoidCallback _) {
                return _statsPages.elementAt(index);
              },
              closedElevation: 8.0,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              closedColor: Theme.of(context).accentColor,
              closedBuilder:
                  (BuildContext context, VoidCallback openContainer) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 6.0),
                      Text(_titles.elementAt(index)),
                      Expanded(
                          child: IgnorePointer(
                              child: _cardPreviews.elementAt(index))),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}

class StatsPage extends StatefulWidget {
  StatsPage({Key key, this.chart, this.chartTitle}) : super(key: key);
  final Widget chart;
  final String chartTitle;

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.chartTitle),
      ),
      body: widget.chart,
    );
  }
}
