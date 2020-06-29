import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CoronavirusTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CoronavirusTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory CoronavirusTimeSeriesChart.withSampleData() {
    return new CoronavirusTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  factory CoronavirusTimeSeriesChart.preview() {
    return new CoronavirusTimeSeriesChart(
      _createPreview(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  static final data = [
    new UsTimeSeriesData(new DateTime(2020, 1, 1), 0),
    new UsTimeSeriesData(new DateTime(2020, 1, 30), 0),
    new UsTimeSeriesData(new DateTime(2020, 2, 10), 0),
    new UsTimeSeriesData(new DateTime(2020, 2, 29), 0),
    new UsTimeSeriesData(new DateTime(2020, 1, 1), 0),
    new UsTimeSeriesData(new DateTime(2020, 1, 30), 0),
    new UsTimeSeriesData(new DateTime(2020, 2, 10), 0),
    new UsTimeSeriesData(new DateTime(2020, 2, 29), 0),
  ];

  /// Create one series with sample hard coded data.
  static List<charts.Series<UsTimeSeriesData, DateTime>> _createSampleData() {
    return [
      new charts.Series<UsTimeSeriesData, DateTime>(
        id: 'cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (UsTimeSeriesData cases, _) => cases.time,
        measureFn: (UsTimeSeriesData cases, _) => cases.cases,
        data: data,
      )
    ];
  }

  static List<charts.Series<UsTimeSeriesData, DateTime>> _createPreview() {
    return [
      new charts.Series<UsTimeSeriesData, DateTime>(
        id: 'cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (UsTimeSeriesData cases, _) => cases.time,
        measureFn: (UsTimeSeriesData cases, _) => cases.cases,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class UsTimeSeriesData {
  final DateTime time;
  final int cases;

  UsTimeSeriesData(this.time, this.cases);
}
