import 'package:flutter/material.dart';
import 'package:snowcast/weather/view/weather_page.dart';

void main() {
  runApp(const MainWrapper());
}

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WeatherPage());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<StatefulWidget> createState() {
    return NavigationState();
  }
}

class NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.sunny), label: "Vreme"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Podešavanja"),
            NavigationDestination(icon: Icon(Icons.camera), label: "Kamere"),
          ]),
    );
  }
}
