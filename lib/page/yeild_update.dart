import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert' as convert;

import 'package:b_green/page/splash.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:cron/cron.dart';

class yeild extends StatefulWidget {
  const yeild({super.key, required AppBar appBar});

  @override
  State<yeild> createState() => _HomePageState();
}

class _HomePageState extends State<yeild> {
  int r = 0;
  TextEditingController dataController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('10');
  @override
  void initState() {
    super.initState();
    dataController.text = "";
  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String _name = "";
  var transplanting_day, minimum_day, maximum_day, fistman_day, secondman_day;

  DateTime pickedDate = DateTime.now();
  //DateTime pickedData = DateTime()
int error =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crop Time Line")),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // DropdownButton(items: items, onChanged: dropdownCallback,
              //iconEnabledColor: Colors.green,),
              //   DropdownButtonHideUnderline(child: child)
              TextFormField(
                decoration: InputDecoration(labelText: "Add crop"),
                onChanged: (value) => _name = value,
              ),
              Center(
                child: TextField(
                  controller: dataController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Enter date"),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    // var pickedData = DateTime.parse(formattedString)
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat("yyyy-MM-dd").format(pickedDate);

                      setState(() {
                        dataController.text = formattedDate.toString();
                        
                      });
                    } else {
                      print("Not Selected");
                    }
                  },
                ),
              ),
              Expanded(
                  child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      strokeWidth: 0,
                      value: 0,
                    );
                  } else {
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];

                    list.clear();
                    list = map.values.toList();
                    print("the list returened is $list");
                    var min = list[0].toString();
                    var max = list[1].toString();
                    var trans = list[3].toString();
                    var first_man = list[4].toString();
                    var second_man = list[2].toString();
                    print("minimum$min");
                    print("maximum$max");
                    minimum_day =
                        pickedDate.add(new Duration(days: int.parse(min)));
                    maximum_day =
                        pickedDate.add(new Duration(days: int.parse(max)));
                    secondman_day = pickedDate
                        .add(new Duration(days: int.parse(second_man)));
                    transplanting_day =
                        pickedDate.add(new Duration(days: int.parse(trans)));

                    var crop = list[5].toString();
                    //  print(moisture);

                    //final maximum = double.parse(text);
                    //print("days $maximum");
                    //print("crop $crop");
                    return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Center(
                            child: ListTile(
                              title: Text(
                                "Crop listed are$crop",
                                textAlign: TextAlign.center,
                              ),
                              //  subtitle: Text(list[0].toString()),
                            ),
                          );
                        });
                  }
                },
              )),
              ElevatedButton.icon(
                  onPressed: () {
                    print(DateFormat.yMMMd().format(minimum_day));
                  },
                  icon: Icon(Icons.analytics),
                  label: Text("GET TIMELINE")),
            Text("Predicted Schedule"),

              Text(
                  "Predicted Harvested Time_linr $maximum_day to $minimum_day"),
              Text("Transplanting"),
              Text("$transplanting_day"),

              Text("Manuare Schedule"),
             Text(
                "$fistman_day to $secondman_day",
                style: TextStyle(fontFamily: "Courier", fontSize: 10.0),
              ),

              Text(""),
              // Text(DateFormat('dd/MM/yyyy').format(minimum_day)),
            ],
          )),
    );
  }
}
