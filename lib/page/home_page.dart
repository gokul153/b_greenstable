import 'package:b_green/page/statusiot.dart';
import 'package:flutter/material.dart';
import 'package:b_green/core/color.dart';
//import 'package:begreen/data/category_model.dart';
//import 'package:begreen/data/plant_data.dart';
//import 'package:begreen/page/details_page.dart';
import 'package:b_green/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          leading: TextButton(
            onPressed: () {},
            child: Image.asset(
              'assets/icons/menu.png',
            ),
          ),
          actions: [
            Container(
              height: 40.0,
              width: 40.0,
              margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: green,
                boxShadow: [
                  BoxShadow(
                    color: green.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                /*  image: const DecorationImage(
                  image: AssetImage('assets/images/pro.png'),
                ),*/
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(children: [
                Container(
                  height: 45.0,
                  width: 300.0,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: green),
                    boxShadow: [
                      BoxShadow(
                        color: green.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 45,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/icons/search.png',
                        height: 25,
                      )
                    ],
                  ),
                ),
                //    ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.details_outlined), label: Text("To veiw status")),
              ])),
          ElevatedButton.icon(
              onPressed: () {
               // statusiot();
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const statusiot()),
            );
              },
              icon: Icon(Icons.details_outlined),
              label: Text("To veiw status")),
          //   ElevatedButton.icon(onPressed: onPressed, icon: icon, label: label)
        ])));
  }
}
