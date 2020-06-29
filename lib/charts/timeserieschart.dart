import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CoronavirusTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final bool preview;
  final int ctryIndex;

  CoronavirusTimeSeriesChart(this.seriesList,
      {this.animate, this.preview, this.ctryIndex});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory CoronavirusTimeSeriesChart.withSampleDataUs() {
    return CoronavirusTimeSeriesChart(
      _createSampleData(usdata),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewUs() {
    return CoronavirusTimeSeriesChart(
      _createPreview(usdata),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  factory CoronavirusTimeSeriesChart.withSampleDataPeru() {
    return CoronavirusTimeSeriesChart(
      _createSampleData(perudata),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewPeru() {
    return CoronavirusTimeSeriesChart(
      _createPreview(perudata),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  factory CoronavirusTimeSeriesChart.withSampleDataItaly() {
    return CoronavirusTimeSeriesChart(
      _createSampleData(germanydata),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewItaly() {
    return CoronavirusTimeSeriesChart(
      _createPreview(germanydata),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  factory CoronavirusTimeSeriesChart.withSampleDataUk() {
    return CoronavirusTimeSeriesChart(
      _createSampleData(germanydata),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewUk() {
    return CoronavirusTimeSeriesChart(
      _createPreview(germanydata),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: preview ? const EdgeInsets.all(5.0) : const EdgeInsets.all(10.0),
      child: charts.TimeSeriesChart(
        seriesList,
        animate: animate,
        // Optionally pass in a [DateTimeFactory] used by the chart. The factory
        // should create the same type of [DateTime] as the data provided. If none
        // specified, the default creates local date time.
        dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
    );
  }

  static final usdata = [
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 3, 24), 20341),
    TimeSeriesData(DateTime(2020, 3, 26), 16420),
    TimeSeriesData(DateTime(2020, 4, 5), 32105),
    TimeSeriesData(DateTime(2020, 4, 7), 26493),
    TimeSeriesData(DateTime(2020, 4, 26), 38509),
    TimeSeriesData(DateTime(2020, 5, 9), 30204),
    TimeSeriesData(DateTime(2020, 5, 19), 13227),
    TimeSeriesData(DateTime(2020, 5, 31), 17962),
    TimeSeriesData(DateTime(2020, 6, 15), 25314),
    TimeSeriesData(DateTime(2020, 6, 21), 36617),
    TimeSeriesData(DateTime(2020, 6, 27), 40526),
  ];

  static final perudata = [
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 3, 24), 20341),
    TimeSeriesData(DateTime(2020, 3, 26), 16420),
    TimeSeriesData(DateTime(2020, 4, 5), 32105),
    TimeSeriesData(DateTime(2020, 4, 7), 26493),
    TimeSeriesData(DateTime(2020, 4, 26), 38509),
    TimeSeriesData(DateTime(2020, 5, 9), 30204),
    TimeSeriesData(DateTime(2020, 5, 19), 13227),
    TimeSeriesData(DateTime(2020, 5, 31), 17962),
    TimeSeriesData(DateTime(2020, 6, 15), 25314),
    TimeSeriesData(DateTime(2020, 6, 21), 36617),
    TimeSeriesData(DateTime(2020, 6, 27), 40526),
  ];

  static final germanydata = [
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 3, 24), 20341),
    TimeSeriesData(DateTime(2020, 3, 26), 16420),
    TimeSeriesData(DateTime(2020, 4, 5), 32105),
    TimeSeriesData(DateTime(2020, 4, 7), 26493),
    TimeSeriesData(DateTime(2020, 4, 26), 38509),
    TimeSeriesData(DateTime(2020, 5, 9), 30204),
    TimeSeriesData(DateTime(2020, 5, 19), 13227),
    TimeSeriesData(DateTime(2020, 5, 31), 17962),
    TimeSeriesData(DateTime(2020, 6, 15), 25314),
    TimeSeriesData(DateTime(2020, 6, 21), 36617),
    TimeSeriesData(DateTime(2020, 6, 27), 40526),
  ];

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesData, DateTime>> _createSampleData(
      List<TimeSeriesData> data) {
    return [
      charts.Series<TimeSeriesData, DateTime>(
        id: 'cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesData cases, _) => cases.time,
        measureFn: (TimeSeriesData cases, _) => cases.cases,
        data: data,
      )
    ];
  }

  static List<charts.Series<TimeSeriesData, DateTime>> _createPreview(
      List<TimeSeriesData> data) {
    return [
      charts.Series<TimeSeriesData, DateTime>(
        id: 'cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesData cases, _) => cases.time,
        measureFn: (TimeSeriesData cases, _) => cases.cases,
        data: data,
      )
    ];
  }

  static charts.Color getChartColor(Color color) {
    return charts.Color(
        r: color.red, g: color.green, b: color.blue, a: color.alpha);
  }
}

/// Sample time series data type.
class TimeSeriesData {
  final DateTime time;
  final int cases;

  TimeSeriesData(this.time, this.cases);
}
