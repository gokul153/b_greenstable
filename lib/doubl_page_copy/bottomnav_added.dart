import 'package:b_green/page/bottompages/favcrop.dart';
import 'package:b_green/page/bottompages/homepage_update.dart';
import 'package:b_green/page/bottompages/scanpage.dart';
import 'package:flutter/material.dart';
//import 'package:mine/pages/bottompages/homepage.dart';
//import 'package:mine/pages/bottompages/favcrop.dart';
//import 'package:mine/pages/bottompages/news.dart';
//import 'package:mine/pages/bottompages/scanpage.dart';
//import 'package:mine/pages/bottompages/profile.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    // Home(),
    const Scan(),
    const FavoritePage(
      favoritedPlants: [],
    ),
    //const News(),
    //const Profile(),
  ];

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color.fromARGB(255, 40, 49, 27),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onitemTapped,
        backgroundColor: Colors.white, //Color.fromARGB(255, 127, 164, 101),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Your Crops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'You',
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 85, 139, 47),
        iconSize: 24,
        elevation: 30,
        //elevation: 5,
      ),
    );
  }
}
