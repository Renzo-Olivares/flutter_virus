import 'package:flutter/material.dart';
import 'home.dart';
import 'welcome.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Virus',
      theme: _lightCyber,
      darkTheme: _darkCyber,
      home: MyHomePage(title: 'Flutter Virus'),
      initialRoute: '/welcome',
      onGenerateRoute: _getRoute,
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/welcome') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => Welcome(),
    fullscreenDialog: true,
  );
}

final _lightCyber = _buildCyberLightTheme();
final _darkCyber = _buildCyberDarkTheme();

ThemeData _buildCyberLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.indigoAccent,
    accentColor: Colors.indigoAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData _buildCyberDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: Colors.indigo,
    accentColor: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
