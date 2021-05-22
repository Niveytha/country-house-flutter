import 'package:flutter/material.dart';

class CountryMap extends StatelessWidget {
  const CountryMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: Text('Country Name'),
      ),
      body: Text("Map is on it's way"),
    );
  }
}
