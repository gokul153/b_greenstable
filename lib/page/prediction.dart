import 'package:flutter/material.dart';
//import "dart:ui";
//import 'selectcrop.dart';

class Predict extends StatefulWidget {
  const Predict({Key? key}) : super(key: key);
  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  //use this controller to get what user typed
  final _textController = TextEditingController();
  int key = 1;

 // get kDefaultPadding => null;

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
       body: 
       Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Nitrogen Amt.',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Phosphorous Amt.',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Potassium Amt.',
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.green,
              child:
                  const Text('SUBMIT', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );

    // It will provie us total height  and width of our screen

    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    // it enable scrolling on small device
    //body: Container(
    //height: MediaQuery.of(context).devicePixelRatio,
    //child: SingleChildScrollView(
    // child: Column(
    //crossAxisAlignment: CrossAxisAlignment.start,
    /* mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("select crop", style: TextStyle()),

              ///int key=key+1;
              SelectCrop(key: UniqueKey()),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ),
      
      */
    //Container(
    //FORM FOR NPK
  
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
