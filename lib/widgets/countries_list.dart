import 'package:flutter/material.dart';

class CountriesList extends StatelessWidget {
  final String country;
  final Function(String country) changeCountryHandler;
  CountriesList({@required this.country, @required this.changeCountryHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        isExpanded: true,
        onChanged: (value) {
          this.changeCountryHandler(value);
        },
        value: this.country,
        hint: Text('Select your country'),
        items: [
          DropdownMenuItem(
            child: Text('All'),
            value: 'All',
          ),
          DropdownMenuItem(
            child: Text('Pakistan'),
            value: 'Pakistan',
          ),
        ],
      ),
    );
  }
}
