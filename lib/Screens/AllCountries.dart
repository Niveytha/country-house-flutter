import 'package:country_house_flutter/Screens/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;
  getCountries() async {
    var response = await Dio().get('http://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    // will run before build function runs
    getCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });
    super.initState();
  }

  void _filterCountries(value) {
    setState(() {
      filteredCountries = countries
          .where(
            (country) =>
                country['name'].toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: "Search country here...",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel, size: 15),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredCountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: (filteredCountries.length > 0)
            ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Country(filteredCountries[index]),
                        ),
                      );
                    },
                    child: Card(
                      // color: Colors.white12,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                          filteredCountries[index]['name'],
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
        // ListView(
        //   children: <Widget>[
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => Country("Singapore"),
        //           ),
        //         );
        //       },
        //       child: Card(
        //         // color: Colors.white12,
        //         elevation: 3,
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             'Country 1: Singapore',
        //             style: TextStyle(fontSize: 19),
        //           ),
        //         ),
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => Country("Australia"),
        //           ),
        //         );
        //       },
        //       child: Card(
        //         // color: Colors.white12,
        //         elevation: 3,
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             'Country 2: Australia',
        //             style: TextStyle(fontSize: 19),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
