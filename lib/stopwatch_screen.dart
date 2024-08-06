import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  StopwatchScreenState createState() => StopwatchScreenState();
}

class StopwatchScreenState extends State<StopwatchScreen> {
  final Stopwatch stopwatch = Stopwatch();
  late Timer timer;
  String result = '00:00:00';

  void start() {
    if (!stopwatch.isRunning) {
      stopwatch.start();
      timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
        setState(() {
          result = '${stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
        });
      });
    }
  }

  void pause() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
      timer.cancel();
    }
  }

  void reset() {
    stopwatch.reset();
    setState(() {
      result = '00:00:00';
    });
  }

  @override
  void dispose() {
    stopwatch.stop();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizedBox sb1 = const SizedBox(height: 20);

    Icon icn1 = const Icon(Icons.play_arrow);
    ElevatedButton elebtn1 = ElevatedButton( onPressed: start, child: icn1);

    Icon icn2 = const Icon(Icons.pause);
    ElevatedButton elebtn2 = ElevatedButton( onPressed: pause, child: icn2);

    Icon icn3 = const Icon(Icons.refresh);
    ElevatedButton elebtn3 = ElevatedButton( onPressed: reset, child: icn3);

    Row r1 = Row(mainAxisAlignment: MainAxisAlignment.center, children: [elebtn1, sb1, elebtn2, sb1, elebtn3]);

    TextStyle tsl1 = const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);
    Text txt1 = Text(result, style: tsl1);
    Column cl1 = Column( mainAxisAlignment: MainAxisAlignment.center, children: [txt1, sb1, r1]);
    Center cnt = Center(child: cl1);

    Text txt2 = const Text('Flutter Stopwatch');
    AppBar ab = AppBar(title: txt2);

    Scaffold sf = Scaffold(appBar: ab, body: cnt);
    return sf;
  }
}