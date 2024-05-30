import 'package:final_project/profile_setter.dart';
import 'package:flutter/material.dart';
import 'WaterTable.dart';

class Water extends StatelessWidget {
  const Water({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.blue[50],
          fontFamily: 'Raleway',
      ),
      home: const FirstPage(title: 'Water Tracker'),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:Center(
          child: ProfileSetter(),
        ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.title, required this.name, required this.weight, required this.activity}) : super(key: key);
  final String title;
  final String name;
  final double weight;
  final String activity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, $name!"),
      ),
      body: Center(
        child: (
          WaterTable(name: name, weight: weight, activity: activity)
       ),
      ),
    );
  }
}