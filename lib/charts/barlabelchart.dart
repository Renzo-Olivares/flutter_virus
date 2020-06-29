import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CoronavirusBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final bool preview;

  CoronavirusBarLabelChart(this.seriesList, {this.animate, this.preview});

  /// Creates a [BarChart] with sample data
  factory CoronavirusBarLabelChart.withSampleData() {
    return CoronavirusBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusBarLabelChart.preview() {
    return CoronavirusBarLabelChart(
      _createPreview(),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: preview
          ? const EdgeInsets.only(right: 10.0, top: 6.0)
          : const EdgeInsets.only(right: 12.0),
      child: new charts.BarChart(
        seriesList,
        animate: animate,
        vertical: false,
        barRendererDecorator: preview
            ? null
            : charts.BarLabelDecorator<String>(
                outsideLabelStyleSpec: charts.TextStyleSpec(
                    color: CoronavirusBarLabelChart.getChartColor(
                        Colors.grey[500])),
              ),
        // Hide domain axis.
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
            renderSpec: charts.GridlineRendererSpec(
                labelStyle: charts.TextStyleSpec(
          color: preview
              ? MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? null
                  : CoronavirusBarLabelChart.getChartColor(Colors.white)
              : CoronavirusBarLabelChart.getChartColor(Colors.grey[500]),
        ))),
      ),
    );
  }

  static final data = [
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

  /// Create one series with sample hard coded data.
  static List<charts.Series<RegionData, String>> _createSampleData() {
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

  static List<charts.Series<RegionData, String>> _createPreview() {
    return [
      new charts.Series<RegionData, String>(
        id: 'Region',
        domainFn: (RegionData cases, _) => cases.region,
        measureFn: (RegionData cases, _) => cases.cases,
        colorFn: (RegionData cases, _) => cases.barColor,
        data: data,
      )
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
