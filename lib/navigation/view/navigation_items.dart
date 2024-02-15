import 'package:flutter/material.dart';
import 'package:snowcast/settings/view/settings_page.dart';
import 'package:snowcast/weather/view/weather_view.dart';
import 'package:snowcast/webcam/view/webcam_page.dart';

List<BottomNavigationBarItem> navigationItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.sunny),
    label: 'Prognoza',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.camera),
    label: 'Kamere',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'Podešavanja',
  ),
];

const List<Widget> pages = <Widget>[
  WeatherPage(),
  WebcamPage(),
  SettingsPage(),
];
