import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sauve_mes_feds/controlleur/timerStat.dart';
import 'package:intl/intl.dart';
// An enum representing the filter type

class Timer extends ConsumerStatefulWidget {
  const Timer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerState();
}

class _TimerState extends ConsumerState<Timer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var timer = ref.watch(timerProvider);
    var temps = DateFormat.ms()
        .format(DateTime(0, 0, 0, 0, 0, timer.timeLeft))
        .toString();
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            LinearProgressIndicator(
                semanticsLabel: 'Temps restant',
                value: timer.timeLeft.toDouble()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Temps restant"),
                    Text(
                      temps,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (timer.timeLeft > 0)
                      IconButton(
                        onPressed: () {
                          ref.watch(timerProvider.notifier).timerManager();
                        },
                        icon:
                            timer.buttonState != ButtonState.PAUSED //Play icon
                                ? Icon(Icons.pause, size: 40)
                                : Icon(
                                    Icons.play_arrow,
                                    size: 40,
                                  ),
                      ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        ref.watch(timerProvider.notifier).restart();
                      },
                      icon: Icon(
                        Icons.restart_alt,
                        size: 40,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
