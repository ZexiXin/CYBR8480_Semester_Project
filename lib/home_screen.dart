import 'package:flutter/material.dart';
import 'package:semeter_project_health_app/supply/hydration_screen.dart';
import 'package:semeter_project_health_app/useddata.dart';
import 'supply/tile.dart';


const kTileDefaultBackgroundColor = Colors.white;
const kTileDefaultTextColor = Color(0xFF0A2F47);
const kTileDefaultBorderColor = Color(0xFFE8EAEE);

const kSwatchBlueColor = Color(0xFF52BEFF);
const kSwatchPinkColor = Color(0xFFFE385E);

var tempbpm = BPM(bpm: 0);

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'For today',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HydrationScreen()),
                          );
                        },
                        child: Tile(
                          backgroundColor: kSwatchBlueColor,
                          borderColor: kSwatchBlueColor,
                          textColor: Colors.white,
                          icon: Icons.opacity,
                          title: '4',
                          subtitle: 'Cups',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: Tile(
                        backgroundColor: kTileDefaultBackgroundColor,
                        borderColor: kTileDefaultBorderColor,
                        textColor: kTileDefaultTextColor,
                        title: '15394',//steps.toString(),
                        subtitle: 'steps',
                        icon: Icons.directions_walk,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Tile(
                        backgroundColor: kTileDefaultBackgroundColor,
                        borderColor: kTileDefaultBorderColor,
                        textColor: kTileDefaultTextColor,
                        title: '2033', //kcal.toString(),
                        subtitle: 'kcal',
                        icon: Icons.local_fire_department,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Tile(
                        backgroundColor: kTileDefaultBackgroundColor,
                        borderColor: kTileDefaultBorderColor,
                        textColor: kTileDefaultTextColor,
                        title: '40',//time.toString(),
                        subtitle: 'min',
                        icon: Icons.timer,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Tile(
                        backgroundColor: kSwatchPinkColor,
                        borderColor: kSwatchPinkColor,
                        textColor: Colors.white,
                        icon: Icons.favorite,
                        title: tempbpm.value,
                        subtitle: 'bpm',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}