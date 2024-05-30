import 'package:flutter/material.dart';
import 'profile.dart';

class Result extends StatelessWidget {
  final Profile p;
  const Result({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return (
        Scaffold(
          appBar: AppBar(
              title: const Text(
                  'Successful')
          ),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    p.name,
                    style: const TextStyle(
                        fontSize: 22
                    )
                ),
                Text(
                    p.activity,
                    style: const TextStyle(
                        fontSize: 22
                    )
                ),
                Text(
                    p.weight.toString(),
                    style: const TextStyle(
                        fontSize: 22
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}