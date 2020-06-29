import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:fluttervirus/charts/barlabelchart.dart';
import 'package:fluttervirus/charts/piechart.dart';
import 'package:fluttervirus/charts/timeserieschart.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List<Widget> _statsPages = [
    StatsPage(
        chart: CoronavirusBarLabelChart.withSampleData(),
        chartTitle: 'Coronavirus Cases by Region'),
    StatsPage(
      chart: CoronavirusPieChart.withSampleData(),
      chartTitle: 'Coronavirus Cases by Country',
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataUs(),
      chartTitle: 'US Coronavirus Cases',
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataPeru(),
      chartTitle: 'Peru Coronavirus Cases',
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataItaly(),
      chartTitle: 'Germany Coronavirus Cases',
    ),
    StatsPage(
      chart: CoronavirusTimeSeriesChart.withSampleDataUk(),
      chartTitle: 'UK Coronavirus Cases',
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
                  child: IgnorePointer(child: _cardPreviews.elementAt(index)),
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
        title: Text(widget.chartTitle),
      ),
      body: widget.chart,
    );
  }
}
