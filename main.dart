import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _percent;

  @override
  void initState() {
    _percent = 0;
    super.initState();
  }

  double kek() {
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (_percent < 1) {
        setState(() {
          _percent += .00001;
        });
        print(_percent);
      }
      else {
        setState(() {
          _percent = 1;
        });
        timer.cancel();
      }
      print(timer.isActive);
    });
    return _percent;
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: kek(),
      radius: 100,
      animationDuration: 1,
      animation: true,
      animateFromLastPercent: true,
      backgroundColor: const Color(0xFFE8E8E8),
      progressColor: const Color(0xFF3BB75F),
    );
  }
}
