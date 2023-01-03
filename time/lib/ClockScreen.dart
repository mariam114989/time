// ignore: file_names

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
// ignore: unnecessary_import, implementation_imports
import 'package:flutter/src/widgets/container.dart';
// ignore: unnecessary_import, implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:time/digitaltime.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  double minutesAngle = 0;
  double secondsAngle = 0;
  double hoursAngle = 0;

  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final now = DateTime.now();
      // ignore: avoid_print
      print(now);
      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minutesAngle = pi / 30 * now.minute;
        hoursAngle = (pi / 6 * now.hour) + (pi / 45 * minutesAngle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.punch_clock_sharp),
        title: const Text('clock'),
      ),
      body: Center(
        child: Container(
          // ignore: sort_child_properties_last
          child: Stack(
            children: <Widget>[
              Image.asset('assets/clock.png'),
              //second
              Transform.rotate(
                // ignore: sort_child_properties_last
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Container(
                    width: 2,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: const Alignment(0, -0.35),
                ),
                angle: secondsAngle,
              ),
              Transform.rotate(
                // ignore: sort_child_properties_last
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Container(
                    width: 5,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: const Alignment(0, -0.35),
                ),
                angle: minutesAngle,
              ),
              //Hour
              Transform.rotate(
                // ignore: sort_child_properties_last
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Container(
                    width: 7,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 104, 9, 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: const Alignment(0, -0.2),
                ),
                angle: hoursAngle,
              ),
              //dot
              Transform.rotate(
                // ignore: sort_child_properties_last
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  alignment: const Alignment(0, 0),
                ),
                angle: hoursAngle,
              ),
            ],
          ),

          //around the clock
          width: 370, height: 370,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 104, 9, 2), width: 8),
            borderRadius: BorderRadius.circular(200),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // ignore: sort_child_properties_last
        child: const Icon(Icons.timer),
        backgroundColor: const Color.fromARGB(255, 104, 9, 2),
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const BottomAppBar(color: Colors.white),
    );
  }
}
