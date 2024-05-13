import 'package:flutter/material.dart';
import 'package:Atleasy/widgets/search_bar.dart';
import 'package:Atleasy/widgets/horizontal_place_item.dart';
import 'package:Atleasy/widgets/vertical_place_item.dart';
import 'package:Atleasy/models/api.dart';
import 'package:Atleasy/models/location.dart';
import 'package:Atleasy/models/experience.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          width: 150,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Location>>(
        future: LocationApi.getLocations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Location> locations = snapshot.data!;
            return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Where to?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Search_Bar(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Top destinations for your vacation",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildHorizontalList(context, locations),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Best Atleasy Experiences",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
                FutureBuilder<List<Experience>>(
                  future: ExperienceApi.getExperiences(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final List<Experience> experiences = snapshot.data!;
                      return buildVerticalList(experiences);
                    }
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }


  Widget buildHorizontalList(BuildContext context, List<Location> locations) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          Location location = locations.reversed.toList()[index];
          return HorizontalPlaceItem(location: location);
        },
      ),
    );
  }

  Widget buildVerticalList(List<Experience> experiences) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: experiences.length,
        itemBuilder: (BuildContext context, int index) {
          Experience experience = experiences[index];
          return VerticalPlaceItem(experience: experience);
        },
      ),
    );
  }
}
