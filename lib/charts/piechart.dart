import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CoronavirusPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final bool preview;

  CoronavirusPieChart(this.seriesList, {this.animate, this.preview});

  /// Creates a [PieChart] with sample data and no transition.
  factory CoronavirusPieChart.withSampleData() {
    return CoronavirusPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusPieChart.preview() {
    return CoronavirusPieChart(
      _createPreview(),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: preview ? const EdgeInsets.all(6.0) : const EdgeInsets.all(10.0),
      child: charts.PieChart(seriesList,
          animate: animate,
          defaultRenderer: preview
              ? null
              : charts.ArcRendererConfig(arcRendererDecorators: [
                  charts.ArcLabelDecorator(
                      insideLabelStyleSpec: charts.TextStyleSpec(
                        fontSize: 10,
                        color: getChartColor(Colors.white),
                      ),
                      outsideLabelStyleSpec: charts.TextStyleSpec(
                        fontSize: 10,
                        color: getChartColor(Colors.grey[500]),
                      ))
                ])),
    );
  }

  static final data = [
    CountryData(
        'United States', 0, 2622986, getChartColor(Colors.blue), '2,622,986'),
    CountryData(
        'Brazil', 1, 1323069, getChartColor(Colors.deepOrange), '1,323,069'),
    CountryData(
        'Russia', 2, 634437, getChartColor(Colors.deepPurpleAccent), '634,437'),
    CountryData('India', 3, 549197, getChartColor(Colors.amber), '549,197'),
    CountryData('United Kingdom', 4, 311151, getChartColor(Colors.purpleAccent),
        '311,151'),
    CountryData('Spain', 5, 295850, getChartColor(Colors.red), '295,850'),
    CountryData(
        'Peru', 6, 275989, getChartColor(Colors.lightGreenAccent), '275,989'),
    CountryData('Chile', 7, 271982, getChartColor(Colors.teal), '271,982'),
    CountryData('Italy', 8, 240310, getChartColor(Colors.pink), '240,310'),
    CountryData(
        'Iran', 9, 222669, getChartColor(Colors.greenAccent), '222,669'),
    CountryData('Mexico', 10, 212802, getChartColor(Colors.lime), '212,802'),
    CountryData('Pakistan', 11, 202955, getChartColor(Colors.brown), '202,955'),
    CountryData('Turkey', 12, 197239, getChartColor(Colors.indigo), '197,239'),
  ];

  /// Create one series with sample hard coded data.
  static List<charts.Series<CountryData, int>> _createSampleData() {
    return [
      new charts.Series<CountryData, int>(
        id: 'Cases',
        domainFn: (CountryData cases, _) => cases.index,
        measureFn: (CountryData cases, _) => cases.cases,
        colorFn: (CountryData cases, _) => cases.pieColor,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (CountryData row, _) =>
            '${row.country}: ${row.strCases}',
      )
    ];
  }

  static List<charts.Series<CountryData, int>> _createPreview() {
    return [
      new charts.Series<CountryData, int>(
        id: 'Cases',
        domainFn: (CountryData cases, _) => cases.index,
        measureFn: (CountryData cases, _) => cases.cases,
        colorFn: (CountryData cases, _) => cases.pieColor,
        data: data,
      )
    ];
  }

  static charts.Color getChartColor(Color color) {
    return charts.Color(
        r: color.red, g: color.green, b: color.blue, a: color.alpha);
  }
}

/// Sample country data type.
class CountryData {
  final String country;
  final int index;
  final int cases;
  final charts.Color pieColor;
  final String strCases;

  CountryData(
      this.country, this.index, this.cases, this.pieColor, this.strCases);
}
