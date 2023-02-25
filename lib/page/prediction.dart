import 'package:b_green/crop/orange.dart';
import 'package:b_green/crop/pigeonpeas.dart';
import 'package:b_green/crop/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:homie/functions.dart';
//import "dart:ui";
//import 'selectcrop.dart';
import 'package:b_green/function.dart';
import 'package:flutter/services.dart';

class Predict extends StatefulWidget {
  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  //use this controller to get what user typed
  final _ntextController = TextEditingController();

  final _ptextController = TextEditingController();

  final _ktextController = TextEditingController();

  final _phtextController = TextEditingController();

  final _rtextController = TextEditingController();

  // key = 1;
  double n = 0, p = 0, k = 0;

  double ph = 0.0, rain = 0.0;

  String url = '';

  int error = 0;

  // get kDefaultPadding => null;
  String cropr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      /*body: Container(
        child: SizedBox(
          width: 200.0,
          height: 200.0,
        ),
        color: Colors.green,
      ),
       Container(
         child: Column(
           children: [
            */
      /*   body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const <Widget>[
            SelectCropCard(
              image: "assets/images/tomato.jpg",
              title: "Tomato",
              country: "Russia",
              //price: 440,
              //press: () {Navigator.push(context,MaterialPageRoute(: (context) => DetailsScreen(),),);},
            ),
            SelectCropCard(
              image: "assets/images/tomato.jpg",
              title: "Tomato",
              country: "Russia",
              // price: 440,
              //press: () {Navigator.push(context,MaterialPageRoute(: (context) => DetailsScreen(),),);},
            ),
            SelectCropCard(
              image: "assets/images/tomato.jpg",
              title: "Samantha",
              country: "Russia",
              //price: 440, key: null,
              //press: () {},
            ),
          ],
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _ntextController,
              decoration: const InputDecoration(
                hintText: 'Nitrogen Level',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _ptextController,
              decoration: const InputDecoration(
                hintText: 'Phosphorous Level',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _ktextController,
              decoration: const InputDecoration(
                hintText: 'Potassium Level',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _phtextController,
              decoration: const InputDecoration(
                hintText: 'pH Value',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _rtextController,
              decoration: const InputDecoration(
                hintText: 'Rainfall in mm',
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                print("butoon presed");
                error = 0;
                n = double.parse(_ntextController.text);
                p = double.parse(_ptextController.text);
                k = double.parse(_ktextController.text);
                ph = double.parse(_phtextController.text);
                rain = double.parse(_rtextController.text);

                if (n > 100 || n <= 0) {
                  const snackbar = SnackBar(
                      content: Text(
                          "Invalid value for nitrogen,phosphorous or pottasium"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  error = 1;
                } else {
                  error = 0;
                }
                if (p <= 0) {
                  const snackbar =
                      SnackBar(content: Text("Invalid value for phosphorous"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  error = 1;
                } else {
                  error = 0;
                }
                if (k <= 0) {
                  const snackbar =
                      SnackBar(content: Text("Invalid value for pottasium"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  error = 1;
                } else {
                  error = 0;
                }
                if (rain <= 0) {
                  const snackbar =
                      SnackBar(content: Text("Invalid value for rain"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  error = 1;
                } else {
                  error = 0;
                }
                if (ph > 14 || ph <= 0) {
                  const snackbar =
                      SnackBar(content: Text("Invalid value for pH"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  error = 1;
                } else {
                  error = 0;
                }
                if (error == 0) {
                  url =
                      'http://ec2-43-205-135-176.ap-south-1.compute.amazonaws.com:8080/crop?n=$n&p=$p&k=$k&ph=$ph&r=$rain';
                  print("fetching");
                //  print(url);
                  http.Response response = await http.get(Uri.parse(url));
                  print(response.body);
                  cropr = response.body;
                  print("from maain$cropr");
                  setState(() {
                    // cropr = "intial";

                    this.cropr = cropr.toString();
                       });
                    //  cropr = "Orange";
                    if (cropr.contains("Orange")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Orange(),
                          ));
                      //   Navigator.of(context).pushReplacementNamed('/Orange');
                    }
                     if (cropr.contains("Pigeonpeas")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pigeon(),
                          ));
                      //   Navigator.of(context).pushReplacementNamed('/Orange');
                    }
                 /*   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => result(),
                        ));*/

                    //    if(cropr)
               
                  // const snackbar = SnackBar(content: Text('crop is$cropr'));
                  //ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  ;
                } else {
                  const snackbar = SnackBar(content: Text("Invalid "));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              color: Colors.green,
              child:
                  const Text('SUBMIT', style: TextStyle(color: Colors.white)),
            ),
            Text("Crop Recommeded According to the condition is as follows \n"),
            Text('$cropr'),
            Text(cropr),
          ],
        ),
      ),
    );
  }
}

class SelectCropCard extends StatelessWidget {
  const SelectCropCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    //required this.price,
    //required this.press,
  }) : super(key: key);

  final String image, title, country;
  //final int price;
  //final Function press;

  get kDefaultPadding => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200,
            height: 100,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.green.withOpacity(0.23),
                ),
              ],
            ),
          );
        });
  }
}
