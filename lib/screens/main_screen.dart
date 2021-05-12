import 'package:covid19_tracker_app/helpers/novel_api.dart';
import 'package:covid19_tracker_app/widgets/countries_list.dart';
import 'package:covid19_tracker_app/widgets/stats.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedCountry = "All";

  void changeSelectedCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CountriesList(
              country: selectedCountry,
              changeCountryHandler: changeSelectedCountry,
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: NovelAPI.getStats(selectedCountry),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Stats(
                    stats: snapshot.data,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
