//import 'package:';
import 'package:b_green/page/meandrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert' as convert;

import 'package:b_green/page/splash.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

Map mapresponse = {};
Map moisture = {};

class statusiot extends StatefulWidget {
  const statusiot({super.key});

  @override
  State<statusiot> createState() => _statusiotState();
}

class _statusiotState extends State<statusiot> {
  final url =
      "https://api.thingspeak.com/channels/2122985/fields/1.json?api_key=ZAXMMFP29JMB5X8H&results=2";
  var _postjson = [];
  dynamic value;
  bool loading = false;
  double wet=0;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final postcontroller = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('FirebaseIOT');
  void get_status() async {}
  void updatewet() {
    setState(() {
      // wet=
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  FetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIVE Time Analyser"),
        backgroundColor: (Colors.green),
      ),
      drawer: MeanDrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(
                    strokeWidth: 2,
                    value: 2,
                  );
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];

                  list.clear();
                  list = map.values.toList();
                  print("the list returened is $list");
                  dynamic water = list[1].toString();
                  //  print(moisture);

                  wet = double.parse(water);
                  print("moisture is $water");
                  print("wet is $wet");
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Center(
                          child: ListTile(
                       //     title: Text("Moisture Level",textAlign: TextAlign.center,),
                         //   subtitle: Text(list[0].toString()),
                          ),
                        );
                      });
                }
              },
            )),

            SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 50, color: Colors.red),
                GaugeRange(
                    startValue: 50, endValue: 75, color: Colors.lightBlue),
                GaugeRange(
                    startValue: 75, endValue: 100, color: Colors.blueAccent)
              ], pointers: <GaugePointer>[
                NeedlePointer(
                  value: wet,
                  enableAnimation: true,
                )
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text(wet.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
            ]),
            Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return ListTile(
                      title: Text(
                        snapshot.child('moisture').value.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Roboto',fontSize: 45),
                      ),
                    );
                  }),
            ),
            
            /*  Center(
              child: Container(
                height: 100,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      // final post = _postjson[i];
                      //print(post);
                      return Text(
                        "moisture: $value",
                        textAlign: TextAlign.center,
                      );
                    }),
              ),
            ),*/

            ElevatedButton(
              onPressed: () {
                ref
                    // .child('1')
                    .set({'status': 1})
                    .then((value) {})
                    .onError((error, stackTrace) {
                      print("error Occured \n");
                    });
              },
              child: Text("Turn on!"),
            ),
            //ToggleButtons(children: children, isSelected: isSelected)
            LiteRollingSwitch(
              value: false,
              textOn: "on",
              textOff: "off",
              colorOn: Colors.greenAccent,
              colorOff: Colors.red,
              iconOn: Icons.water,
              iconOff: Icons.water_damage,
              textSize: 18,
              onChanged: (bool position) {
                print("button is $position");
                if (position == true) {
                  ref
                      // .child('1')
                      .set({'status': 1})
                      .then((value) {})
                      .onError((error, stackTrace) {
                        print("error Occured \n");
                      });
                }
              },
              onDoubleTap: () {},
              onSwipe: () {},
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
