import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'file:///C:/Users/ZexiX/Desktop/UNO/CYBR8480labs/semeter_project_health_app/lib/supply/workout_record.dart';
import 'package:semeter_project_health_app/routemap/googlemap.dart';
import 'package:semeter_project_health_app/videoplayer/youtube.dart';
import 'package:semeter_project_health_app/heartrate/heartbeatpersec.dart';
import 'login/auth.dart';
import 'login/discussion.dart';
import 'supply/hydration_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Firebase Jersey',
      debugShowCheckedModeBanner: false,
      routes: {
        //'support': (context) => HomePage(),
        'homescreen': (context) => TabBarApp(),
        'hydration': (context) => HydrationScreen(),
      },
      initialRoute: 'homescreen',
    ),
  );
}



class TabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Center(
                child: Text(
                    DateFormat.yMMMMd('en_US').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ),
            ],
            title: Text(
              'Health Jersey',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              )
            ),
          ),
          bottomNavigationBar: Material(
            color: Colors.blue,
            child:TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.add_location_alt)),
                Tab(icon: Icon(Icons.upload_file)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.fitness_center_outlined)),
                Tab(icon: Icon(Icons.help)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget> [
              new GoogleMapView(),
              new HomeScreen(),
              new HeartBPM(),
              new YoutubeApp(),
              new ChangeNotifierProvider(
                create: (context) => ApplicationState(),
                builder: (context, _) => CustomerApp(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomerAppView();
  }
}

class HeartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeartBPM();
  }
}