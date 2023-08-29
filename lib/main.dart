// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

//to start any Application ,you should write the code
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StopWatch(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  Timer? repeatedFunction;
  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds == 60) {
          minutes++;
          seconds = 0;
        }
        if (minutes == 60) {
          hours++;
          minutes = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 103, 0, 0),
      appBar: AppBar(
        title: Text(
          "Stop Watch",
          style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 255, 149, 0)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 149, 0)),
                  child: Text(
                    hours.toString().padLeft(2, "0"),
                    style: TextStyle(
                        fontSize: 65,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 149, 0)),
                  child: Text(
                    minutes.toString().padLeft(2, '0'),
                    style: TextStyle(
                        fontSize: 65,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 149, 0)),
                  child: Text(
                    seconds.toString().padLeft(2, '0'),
                    style: TextStyle(
                        fontSize: 65,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "hours",
                  style: TextStyle(
                      // background: Paint(),
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "minutes",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  width: 45,
                ),
                Text(
                  "seconds",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            (hours == 0 && minutes == 0 && seconds == 0)
                ? ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text("start stopWatch"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 34, 107, 0))),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (repeatedFunction!.isActive)
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (repeatedFunction!.isActive)
                                    repeatedFunction!.cancel();
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey)),
                              child: Text(
                                "   Stop  Watch   ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // repeatedFunction = !repeatedFunction;
                                  // if(!repeatedFunction!.isActive)
                                  startTimer();
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 0, 125, 4))),
                              child: Text(
                                "   Rerun  Watch   ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (repeatedFunction!.isActive)
                            repeatedFunction!.cancel();
                          setState(() {
                            seconds = 0;
                            minutes = 0;
                            hours = 0;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: Text(
                          "      Cancel      ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
