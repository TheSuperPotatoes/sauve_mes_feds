import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => TimerState();
}

class TimerState extends State<Timer> {
  //isPlay
  bool _isPlay = false;

  //coutdown
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            LinearProgressIndicator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Temps restant"),
                    Text(
                      "[timer]",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isPlay = !_isPlay;
                        });
                      },
                      icon: _isPlay //Play icon
                          ? Icon(Icons.pause, size: 40)
                          : Icon(
                              Icons.play_arrow,
                              size: 40,
                            ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.stop_circle,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.abc)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
