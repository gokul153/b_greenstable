import 'dart:convert' as convert;

import 'package:b_green/page/meandrawer.dart';
import 'package:b_green/page/splash.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/services.dart';
import 'package:cron/cron.dart';

//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cron = Cron();
  cron.schedule(Schedule.parse('*/1 * * * * *'), () async=> {

  });
//  cron.schedule(Schedule.parse(''),()as)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //final FirebaseApp _fbApp = Firebase.initializeApp();
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B_GREEN',
      theme: ThemeData(
        primaryColor: Colors.green, // Change the primary color
        // accentColor: Colors.red, // Change the accent color
        backgroundColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      // home: HomePage(),
      home: const SplashPage(),
    );
  }
}

Map mapresponse = {};
Map moisture = {};
