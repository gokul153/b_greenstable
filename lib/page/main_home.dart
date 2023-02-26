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

Map mapresponse = {};
Map moisture = {};

class FPage extends StatefulWidget {
  const FPage({Key? key}) : super(key: key);

  @override
  State<FPage> createState() => _FPageState();
}

class _FPageState extends State<FPage> {
  final url =
      "https://api.thingspeak.com/channels/2019435/fields/1.json?api_key=9S859ECUZDHBKRIY&results=2";
  var _postjson = [];
  dynamic value;
  bool loading = false;
  double wet = 0;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final postcontroller = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('FirebaseIOT');
  bool value1 = false;
  void get_status() async {}
  void updatewet() {
    setState(() {
      // wet=
    });
  }

  void FetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // Map jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
      mapresponse = convert.jsonDecode(response.body);
      dynamic data = mapresponse['feeds'];
      value = data[1]["field1"];
      int i = 1;
      // print(jsonData);
      print("feeds $data");
      print("\ndata  $value");
      setState(() {
        var _moisture = double.parse(value);
        assert(_moisture is double);
        print(moisture);
        // final post = _postjson[1];
        //print(post);
      });
    } catch (err) {
      print("exception occured");
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B_green"),
        backgroundColor: (Colors.green),
      ),
      drawer: MeanDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
            ),
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
                  dynamic water = list[0].toString();
                  //  print(moisture);

                  wet = double.parse(water);
                  print("moisture is $water");
                  print("wet is $wet");
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Center(
                                child: Text(
                              "Moisture Level",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Times New Roman", fontSize: 30),
                            )),
                            //   subtitle: Text(list[0].toString()),
                          );
                        }),
                  );
                }
              },
            )),
            FutureBuilder(
              builder: (context, snapshot) {
                return SfRadialGauge(axes: <RadialAxis>[
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
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                        angle: 90,
                        positionFactor: 0.5)
                  ])
                ]);
              },
            ),

            Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return ListTile(
                      title: Text(
                        "Updated value: ${snapshot.child('moisture').value.toString()}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
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

         /*   ElevatedButton(
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
            ),*/
            //ToggleButtons(children: children, isSelected: isSelected)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: LiteRollingSwitch(
                value: value1,
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
                  value1 = false;
                },
                onDoubleTap: () {},
                onSwipe: () {},
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
