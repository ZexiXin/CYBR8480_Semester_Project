// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:semeter_project_health_app/bloodpressure/bloodview.dart';

import 'package:semeter_project_health_app/main.dart';
import 'package:semeter_project_health_app/routemap/googlemap.dart';
import 'package:semeter_project_health_app/useddata.dart';



void main() {
  testWidgets('Heart rate tester', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    BloodPageView blood = BloodPage().createState();
    expect("1",equals(blood.tempbpm.value));

    blood.tempbpm = BPM(bpm: 20);
    expect("20", equals(blood.tempbpm.value));

    /*await tester.tap(find
        .byIcon(Icons.favorite_border)
        .first);*/

    //expect(find.byIcon(Icons.favorite), findsOneWidget);

    //expect(find.text("Show Route"), findsOneWidget);
   // expect(find.text('1'), findsNothing);
    
   
  });
}
