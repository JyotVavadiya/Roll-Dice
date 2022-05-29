import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: xyz(),
    ),
  );
}

class xyz extends StatefulWidget {
  const xyz({Key? key}) : super(key: key);

  @override
  _xyzState createState() => _xyzState();
}

class _xyzState extends State<xyz> {
  int total = 3;

  List images = <String>[
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "6.png",
  ];

  String firstDice = "1.png";
  String secondDice = "2.png";

  var r1 = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 5,
            child: Image.asset("assets/images/back.jpg"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                child: Text(
                  "Total: $total",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 60),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/$firstDice",
                      width: 200,
                    ),
                    Image.asset(
                      "assets/images/$secondDice",
                      width: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 55,
                width: 170,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black
                  ),
                  onPressed: (){
                    int i1 = r1.nextInt(6);
                    int i2 = r1.nextInt(6);

                    setState(() {
                      firstDice = images[i1];
                      secondDice = images[i2];

                      total = i1 + i2 + 2;
                    });
                  },
                  child: Text("Roll Dice", style: TextStyle(fontSize: 20),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}