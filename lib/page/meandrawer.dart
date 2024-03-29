import 'package:b_green/data/bottom_menu.dart';
import 'package:b_green/main.dart';
import 'package:b_green/page/bottompages/homepage_update.dart';
import 'package:b_green/page/home_page.dart';
import 'package:b_green/page/main_home.dart';
import 'package:b_green/page/prediction.dart';
import 'package:b_green/page/splash.dart';
import 'package:b_green/page/statusiot.dart';
import 'package:b_green/page/yeild_update.dart';
import 'package:b_green/widget/bottomnav.dart';
import 'package:flutter/material.dart';

//import './detail_screen.dart';
//import './home_screen.dart';
String memail = "";

class MeanDrawer extends StatelessWidget {
  MeanDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            //color: Theme.of(context).primaryColor,
            color: Color.fromARGB(255, 0, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        //   image: NetworkImage('https://i.pravatar.cc/300')
                        image: AssetImage(
                            'assets/images/MyLogoArt20230224083626.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Welcome user',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Go green B-green',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home_Page',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              /*     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));*/
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Live Data',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FPage(),
                  ));
            },
          ),
          ListTile(
              leading: Icon(Icons.batch_prediction),
              title: Text(
                'Prediction',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Predict(),
                    ));
              }),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(
              'Disease Analysis',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraGalleryDemo(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.nature_outlined),
            title: Text(
              'Yield Notifier',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => yeild(
                        appBar: AppBar(
                      title: Text(""),
                    )),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
