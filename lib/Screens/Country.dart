import 'package:country_house_flutter/Screens/countryMap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;
  const Country(this.country, {Key? key}) : super(key: key); // constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: Text(country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              speed: 600,
              direction: FlipDirection.HORIZONTAL,
              front: CountryCard(title: 'Capital'),
              back: CountryDetailCard(title: country['capital']),
            ),
            FlipCard(
              speed: 600,
              direction: FlipDirection.HORIZONTAL,
              front: CountryCard(title: 'Population'),
              back: CountryDetailCard(title: country['population'].toString()),
            ),
            FlipCard(
              speed: 600,
              direction: FlipDirection.HORIZONTAL,
              front: CountryCard(title: 'Flag'),
              back: Card(
                elevation: 4,
                color: Colors.white,
                child: Center(
                  child: Center(
                      child: SvgPicture.network(
                    country['flag'],
                    width: 200,
                  )),
                ),
              ),
            ),
            FlipCard(
              speed: 600,
              direction: FlipDirection.HORIZONTAL,
              front: CountryCard(title: 'Currency'),
              back: CountryDetailCard(title: country['currencies'][0]['name']),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CountryMap(),
                  ),
                );
              },
              child: CountryCard(title: 'Show on Map'),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  const CountryDetailCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.teal.shade100,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      color: Colors.teal.shade800,
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}
