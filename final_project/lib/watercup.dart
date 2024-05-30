import 'package:flutter/material.dart';

class WaterCup extends StatefulWidget {
  WaterCup({Key? key}) : super(key: key);
  late bool full = false;
  void setFull(){
    full = true;
}
  bool getFull(){
    return full;
  }

  @override
  WaterState createState() => WaterState();
}

class WaterState extends State<WaterCup> {
  String src = "assets/images/empty.png";

  void _setImage() {
    setState(() {
      src =  "assets/images/full.png";
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => _setImage(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Image.asset(src, fit: BoxFit.fill),
        ),
      ),
    );
  }
}