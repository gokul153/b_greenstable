
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cron/cron.dart';
class yeild extends StatefulWidget {
  const yeild({super.key, required AppBar appBar});

  @override
  State<yeild> createState() => _HomePageState();
}

class _HomePageState extends State<yeild> {
TextEditingController dataController=TextEditingController();

@override
void initState(){
  super.initState();
  dataController.text="";
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
  String _name="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Yeild Updater")),
    body: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
        // DropdownButton(items: items, onChanged: dropdownCallback,
          //iconEnabledColor: Colors.green,),
       //   DropdownButtonHideUnderline(child: child)
       TextFormField(decoration: InputDecoration(labelText: "Add crop"),
       onChanged: (value) => _name=value,),
          Center(child:
           TextField(
            controller: dataController,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              labelText: "Enter date"
            ),
            readOnly: true,
            onTap: () async{
              DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101),);
             if(pickedDate !=null){
String formattedDate=DateFormat("yyyy-MM-dd").format(pickedDate);

               setState(() {
                 dataController.text=formattedDate.toString();
               });
             }else{
              print("Not Selected");
             }
            },
     


          ),),
        ],
      )),
      );
    
    
   
  }
}