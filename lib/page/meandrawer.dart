import 'package:b_green/main.dart';
import 'package:b_green/page/prediction.dart';
import 'package:b_green/page/statusiot.dart';
import 'package:flutter/material.dart';

//import './detail_screen.dart';
//import './home_screen.dart';
class MeanDrawer extends StatelessWidget {
  const MeanDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            //color: Theme.of(context).primaryColor,
            color: Colors.green,
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
                          image: NetworkImage('https://i.pravatar.cc/300')),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
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
                    builder: (context) => statusiot(),
                  ));
            },
          ),
          ListTile(
              leading: Icon(Icons.arrow_back),
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
              'search',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.apple),
            title: Text(
              'apple',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
