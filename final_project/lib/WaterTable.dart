import 'package:final_project/watercup.dart';
import 'package:flutter/material.dart';

class WaterTable extends StatefulWidget {
  final String name;
  final String activity;
  final double weight;
  const WaterTable({Key? key, required this.name, required this.activity, required this.weight}) : super(key: key);

  @override
  WaterTableState createState() => WaterTableState();
}
  class WaterTableState extends State<WaterTable>  {
  late List<WaterCup> watercups = [];
  late List<bool> watercupsBools = [];
  int numCups = 0;
  int numOz = 0;
  String text = "";
  String text2 = "";
  int finished = 0;
  void _setWeightAndActivityandNumCups() {
    setState(() {
      if(widget.activity == "Low"){
        numCups = (widget.weight~/ 2 + 22)~/8;
      }
      else if(widget.activity == "Medium"){
        numCups = (widget.weight~/ 2 + 15)~/8;
      }
      else{
        numCups = (widget.weight~/ 2)~/8;
      }
    });
  }
  void _setNumOz(){
    setState(() {
      numOz = numCups*8;
    });
  }
  void _setWaterCups() {
    setState(() {
      for(int i = 0; i<numCups; i++){
        WaterCup w = WaterCup();
        watercups.add(w);
        watercupsBools.add(false);
      }
    });
  }
  void _emptyWaterCups() {
    setState(() {
        watercups = [];
    });
  }
  void _setBool(int index){
    setState(() {
      if(watercupsBools[index] == false){
      watercupsBools[index] = true;
      finished = finished + 1;
      }

      if(finished == numCups){
        text = "Congrats!";
        text2 = "You've reached today's water goal.";
      }
    }
    );
    }

  @override
  Widget build(BuildContext context) {
    _emptyWaterCups();
    _setWeightAndActivityandNumCups();
    _setWaterCups();
    _setNumOz();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
        fontFamily: 'Raleway',
      ),
      home: Scaffold(
        body:
        Center(
          child: SizedBox(
          width: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child:
                  Text(
                    "Today's goal: $numCups cups / $numOz oz",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child:
                  Text(
                    "Tap on a glass to record 1 cup (8 oz) of water drunk" ,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Expanded(
                  child:
                     GridView.builder(
                         itemCount: watercups.length,
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 5,
                         ),
                         itemBuilder: (
                             BuildContext context, int index)
                         {
                          return
                          GestureDetector(
                            onPanDown: (details) => _setBool(index),
                            child: SizedBox(
                                child: watercups[index]
                            ),
                          );
                         }
                         ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 35,
                        color: Colors.pink
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Text(
                    text2,
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.pink
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

