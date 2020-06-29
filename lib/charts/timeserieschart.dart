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
      _createSampleData(usdata, getChartColor(Colors.blue)),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewUs() {
    return CoronavirusTimeSeriesChart(
      _createPreview(usdata, getChartColor(Colors.blue)),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  factory CoronavirusTimeSeriesChart.withSampleDataPeru() {
    return CoronavirusTimeSeriesChart(
      _createSampleData(perudata, getChartColor(Colors.red)),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewPeru() {
    return CoronavirusTimeSeriesChart(
      _createPreview(perudata, getChartColor(Colors.red)),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  factory CoronavirusTimeSeriesChart.withSampleDataItaly() {
    return CoronavirusTimeSeriesChart(
      _createSampleData(italydata, getChartColor(Colors.green)),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewItaly() {
    return CoronavirusTimeSeriesChart(
      _createPreview(italydata, getChartColor(Colors.green)),
      // Disable animations for image tests.
      animate: false,
      preview: true,
    );
  }

  factory CoronavirusTimeSeriesChart.withSampleDataUk() {
    return CoronavirusTimeSeriesChart(
      _createSampleData(ukdata, getChartColor(Colors.cyan)),
      // Disable animations for image tests.
      animate: true,
      preview: false,
    );
  }

  factory CoronavirusTimeSeriesChart.previewUk() {
    return CoronavirusTimeSeriesChart(
      _createPreview(ukdata, getChartColor(Colors.cyan)),
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
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
              labelStyle: charts.TextStyleSpec(
            color: preview
                ? MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? null
                    : getChartColor(Colors.white)
                : getChartColor(Colors.grey[500]),
          )),
        ),
        domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
            labelStyle: charts.TextStyleSpec(
              color: preview
                  ? MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? null
                      : getChartColor(Colors.white)
                  : getChartColor(Colors.grey[500]),
            ),
          ),
        ),
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
    TimeSeriesData(DateTime(2020, 3, 24), 0),
    TimeSeriesData(DateTime(2020, 3, 26), 0),
    TimeSeriesData(DateTime(2020, 4, 5), 181),
    TimeSeriesData(DateTime(2020, 4, 7), 535),
    TimeSeriesData(DateTime(2020, 4, 26), 734),
    TimeSeriesData(DateTime(2020, 5, 9), 3709),
    TimeSeriesData(DateTime(2020, 5, 19), 3732),
    TimeSeriesData(DateTime(2020, 5, 31), 6506),
    TimeSeriesData(DateTime(2020, 6, 15), 4383),
    TimeSeriesData(DateTime(2020, 6, 21), 3537),
    TimeSeriesData(DateTime(2020, 6, 27), 3913),
  ];

  static final italydata = [
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 240),
    TimeSeriesData(DateTime(2020, 3, 24), 4789),
    TimeSeriesData(DateTime(2020, 3, 26), 5210),
    TimeSeriesData(DateTime(2020, 4, 5), 4805),
    TimeSeriesData(DateTime(2020, 4, 7), 3599),
    TimeSeriesData(DateTime(2020, 4, 26), 2357),
    TimeSeriesData(DateTime(2020, 5, 9), 1327),
    TimeSeriesData(DateTime(2020, 5, 19), 451),
    TimeSeriesData(DateTime(2020, 5, 31), 416),
    TimeSeriesData(DateTime(2020, 6, 15), 338),
    TimeSeriesData(DateTime(2020, 6, 21), 264),
    TimeSeriesData(DateTime(2020, 6, 27), 255),
  ];

  static final ukdata = [
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 0),
    TimeSeriesData(DateTime(2020, 1, 1), 0),
    TimeSeriesData(DateTime(2020, 1, 30), 0),
    TimeSeriesData(DateTime(2020, 2, 10), 0),
    TimeSeriesData(DateTime(2020, 2, 29), 3),
    TimeSeriesData(DateTime(2020, 3, 24), 967),
    TimeSeriesData(DateTime(2020, 3, 26), 1452),
    TimeSeriesData(DateTime(2020, 4, 5), 3735),
    TimeSeriesData(DateTime(2020, 4, 7), 3802),
    TimeSeriesData(DateTime(2020, 4, 26), 4913),
    TimeSeriesData(DateTime(2020, 5, 9), 4649),
    TimeSeriesData(DateTime(2020, 5, 19), 2711),
    TimeSeriesData(DateTime(2020, 5, 31), 1604),
    TimeSeriesData(DateTime(2020, 6, 15), 1514),
    TimeSeriesData(DateTime(2020, 6, 21), 1295),
    TimeSeriesData(DateTime(2020, 6, 27), 1380),
  ];

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesData, DateTime>> _createSampleData(
      List<TimeSeriesData> data, charts.Color color) {
    return [
      charts.Series<TimeSeriesData, DateTime>(
        id: 'cases',
        colorFn: (_, __) => color,
        domainFn: (TimeSeriesData cases, _) => cases.time,
        measureFn: (TimeSeriesData cases, _) => cases.cases,
        data: data,
      )
    ];
  }

  static List<charts.Series<TimeSeriesData, DateTime>> _createPreview(
      List<TimeSeriesData> data, charts.Color color) {
    return [
      charts.Series<TimeSeriesData, DateTime>(
        id: 'cases',
        colorFn: (_, __) => color,
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
