import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_database/firebase_database.dart';
final databaseReference = FirebaseDatabase.instance.reference();
class Customapp extends StatefulWidget {
  const Customapp({Key? key}) : super(key: key);

  @override
  State<Customapp> createState() => _CustomappState();
}

class _CustomappState extends State<Customapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BGREEN")),
    );
  }
}
