import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 15.0),
        Text(
          'Coronavirus Cases by Region',
          style: Theme.of(context).textTheme.headline5,
        ),
        Expanded(child: CoronavirusBarLabelChart.withSampleData()),
      ],
    );
  }
}

class CoronavirusBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CoronavirusBarLabelChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data
  factory CoronavirusBarLabelChart.withSampleData() {
    return new CoronavirusBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(
        outsideLabelStyleSpec:
            charts.TextStyleSpec(color: getChartColor(Colors.grey[500])),
      ),
      // Hide domain axis.
      domainAxis: new charts.OrdinalAxisSpec(
        renderSpec: new charts.NoneRenderSpec(),
      ),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
              labelStyle: new charts.TextStyleSpec(
        color: getChartColor(Colors.grey[500]),
      ))),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<RegionData, String>> _createSampleData() {
    final data = [
      RegionData(
          'Americas', 4816794, '4,816,794', getChartColor(Colors.deepOrange)),
      RegionData('Europe', 2638903, '2,638,903', getChartColor(Colors.indigo)),
      RegionData('Eastern Mediterranean', 1006279, '1,006,279',
          getChartColor(Colors.amber)),
      RegionData(
          'South-East Asia', 710455, '710,455', getChartColor(Colors.cyan)),
      RegionData('Africa', 268102, '268,102', getChartColor(Colors.deepPurple)),
      RegionData(
          'Western Pacific', 211774, '211,774', getChartColor(Colors.teal)),
    ];

    return [
      new charts.Series<RegionData, String>(
          id: 'Region',
          domainFn: (RegionData cases, _) => cases.region,
          measureFn: (RegionData cases, _) => cases.cases,
          colorFn: (RegionData cases, _) => cases.barColor,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (RegionData area, _) =>
              '${area.region}: ${area.strCases}')
    ];
  }

  static charts.Color getChartColor(Color color) {
    return charts.Color(
        r: color.red, g: color.green, b: color.blue, a: color.alpha);
  }
}

/// Sample Region data
class RegionData {
  final String region;
  final int cases;
  final String strCases;
  final charts.Color barColor;

  RegionData(this.region, this.cases, this.strCases, this.barColor);
}
