import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: AllCountries(),
  ));
}

class AllCountries extends StatelessWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Countries'),
      ),
    );
  }
}
