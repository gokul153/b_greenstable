import 'dart:convert' as convert;

import 'package:b_green/page/splash.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //final FirebaseApp _fbApp = Firebase.initializeApp();
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.blue,
          ),
      // home: HomePage(),
      home: const SplashPage(),
    );
  }
}

Map mapresponse = {};
Map moisture = {};

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url =
      "https://api.thingspeak.com/channels/2019435/fields/1.json?api_key=9S859ECUZDHBKRIY&results=2";
  var _postjson = [];
  dynamic value;
  bool loading = false;
  double wet = 0;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final postcontroller = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('FirebaseIOT');
  void get_status() async {}

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
      appBar: AppBar(title: Text("B_green")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                FetchPosts();
              },
              child: Text("Read example"),
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
                  double moisture = list[1];
                  wet = moisture;
                  print("moisture is $moisture");
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Moisture Level"),
                          subtitle: Text(list[1].toString()),
                        );
                      });
                }
              },
            )),
            SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 50, color: Colors.red),
                GaugeRange(
                    startValue: 50, endValue: 100, color: Colors.lightBlue),
                GaugeRange(
                    startValue: 100, endValue: 150, color: Colors.blueAccent)
              ], pointers: <GaugePointer>[
                NeedlePointer(value: wet)
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text(wet.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
            ]),

            /*Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return ListTile(
                      title: Text(snapshot.child('moisture').value.toString()),
                    );
                  }),
            ),*/
            Center(
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
            ),
            TextField(
              maxLines: 2,
              controller: postcontroller,
              decoration: InputDecoration(
                  hintText: "add detail", border: OutlineInputBorder()),
            ),
            ElevatedButton(
              onPressed: () {
                databaseRef
                    .child('1')
                    .set({'id': 1})
                    .then((value) {})
                    .onError((error, stackTrace) {
                      print("error Occured \n");
                    });
              },
              child: Text("Write data"),
            )
          ],
        ),
      ),
    );
  }
}
