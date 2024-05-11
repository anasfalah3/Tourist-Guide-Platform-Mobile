import 'package:flutter/material.dart';
import 'package:Atleasy/util/places.dart';
import 'package:Atleasy/widgets/horizontal_place_item.dart';
// import 'package:Atleasy/widgets/icon_badge.dart';
import 'package:Atleasy/widgets/search_bar.dart';
import 'package:Atleasy/widgets/vertical_place_item.dart';

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
        // actions: <Widget>[
        //   IconButton(
        //     icon: IconBadge(
        //       icon: Icons.notifications_none,
        //       size: 24.0,
        //       color: Color.fromARGB(255, 236, 0, 0),
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: ListView(
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
          buildHorizontalList(context),
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
          buildVerticalList(),
        ],
      ),
    );
  }


  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = locations.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: experiences == null ? 0 : experiences.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = experiences[index];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}
