// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semeter_project_health_app/heartrate/chart.dart';
import 'package:semeter_project_health_app/heartrate/heartbeatpersec.dart';
import 'package:semeter_project_health_app/login/auth.dart';
import 'package:semeter_project_health_app/login/discussion.dart';

import 'package:semeter_project_health_app/routemap/googlemap.dart';
import 'package:semeter_project_health_app/supply/hydration_screen.dart';
import 'package:semeter_project_health_app/supply/workout_record.dart';
import 'package:semeter_project_health_app/useddata.dart';
import 'package:semeter_project_health_app/videoplayer/video.dart';
import 'package:semeter_project_health_app/videoplayer/youtube.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


void main() {

  Widget testWidget({Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Heart rate tester', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    HeartBPMView blood = HeartBPM().createState();
    expect("1",equals(blood.tempbpm.value));

    blood.tempbpm = BPM(bpm: 20);
    expect("20", equals(blood.tempbpm.value));
    expect(false, blood.process);
    expect(false, blood.tog);

  });

  testWidgets('Heart rate chart 2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final sensor = new SensorValue(DateTime.utc(1989, 11, 9), 20);
    final sensor1 = new SensorValue(DateTime.utc(1999, 11, 9), 25);
    final List<SensorValue> temp = [sensor, sensor1];
    final chart = new Chart(temp);

    expect(sensor.value, equals(chart.data[0].value));
    expect(sensor1.value, equals(chart.data[1].value));

  });


  testWidgets('Authentication', (WidgetTester tester) async {

    Authentication auth = new Authentication(loginState: null, email: "x123@unomaha.edu",
        startLoginFlow: null, verifyEmail: null, signInWithEmailAndPassword: null,
        cancelRegistration: null, registerAccount: null, signOut: null);

    expect(null, auth.loginState);
    expect("x123@unomaha.edu", equals(auth.email));
    expect(null, auth.verifyEmail);

    ApplicationState appstate = new ApplicationState();
    expect(ApplicationLoginState.loggedOut, equals(appstate.loginState));
    appstate.startLoginFlow();
    expect(ApplicationLoginState.emailAddress, equals(appstate.loginState));

    ApplicationState appstate2 = new ApplicationState();
    expect(ApplicationLoginState.loggedOut, equals(appstate2.loginState));
    appstate2.cancelRegistration();
    expect(ApplicationLoginState.emailAddress, equals(appstate2.loginState));


  });

  testWidgets('Customer View Test', (WidgetTester tester) async {
    final akey = Key("nice");
    CustomerAppView cav = new CustomerAppView(key: akey);
    expect(akey, equals(cav.key));

  });


  testWidgets('Google GPS Test', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget(child: new GoogleMapView()));
    expect(find.byType(MapView), findsOneWidget);

  });

  testWidgets('Google GPS Test', (WidgetTester tester) async {

    await tester.pumpWidget(testWidget(child: new MapView()));
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(TextField), findsWidgets);
    expect(find.byType(Scaffold), findsWidgets);
    expect(find.byType(GoogleMap), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(ClipOval), findsWidgets);
    // ignore: deprecated_member_use
    expect(find.byType(RaisedButton), findsOneWidget);

  });

  testWidgets('Workout Record Test', (WidgetTester tester) async {

    final color = new Color(1);
    await tester.pumpWidget(testWidget(child: new NumberTile(textColor: color, content: "Good",)));
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.text("Good"), findsOneWidget);


  });

  testWidgets('Workout Record Test 2', (WidgetTester tester) async {

    await tester.pumpWidget(testWidget(child: new HomeScreen()));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Icon), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);

  });

  testWidgets('Video Test', (WidgetTester tester) async {

    await tester.pumpWidget(testWidget(child: new VideoPlayerApp()));
    expect(find.byType(VideoPlayerScreen), findsOneWidget);

    final akey = new Key("Nooice");
    await tester.pumpWidget(testWidget(child: new YoutubeApp()));

    expect(find.byType(YoutubePage), findsOneWidget);

    await tester.pumpWidget(testWidget(child: new YoutubePage()));

    expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
    expect(find.byType(YoutubePlayer), findsWidgets);
    expect(find.byIcon(Icons.settings), findsOneWidget);

  });




  //await tester.enterText(find.byType(TextField), 'hi');
  //await tester.pump();

  //await tester.pumpWidget(testWidget(child: new CustomerAppView()));
  //await tester.pumpAndSettle();
  //final value = find.text("Placing Finger Under the Camera after Tap");

  //expect(value, findsOneWidget);
  /*await tester.tap(find
          .byIcon(Icons.favorite_border)
          .first);*/

  //expect(find.byIcon(Icons.favorite), findsOneWidget);

}
