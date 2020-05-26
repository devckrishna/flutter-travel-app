import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/hotel_model.dart';
import 'package:travel_app/widgets/destinations.dart';
import 'package:travel_app/widgets/hotels.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.pizzaSlice,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.car
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(
          _icons[index],
          size: 30,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 40),
            child: Text(
              "Where would you like to go ?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1
              ),
            ),
          ),
          SizedBox(height: 7),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList()),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Top Destinations",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                    ),

                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor
                  ),)
                ),

            ],
          ),
          Destinations(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Hotels",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                    ),

                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor
                  ),)
                ),

            ],
          ),
          
          Hotels()
        ],
      )),
    );
  }
}
