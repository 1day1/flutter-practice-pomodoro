import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalDone = 0;
  late Timer timer;
  bool isDayAndNight = false;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalDone = totalDone + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onResetPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
    timer.cancel();
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var time = duration.toString().split('.').first.substring(2, 7);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDayAndNight
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).shadowColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: IconButton(
                    iconSize: 50,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onResetPressed : () {},
                    icon: Icon(
                      isRunning ? Icons.restart_alt_outlined : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                        Text(
                          '$totalDone',
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
