/////////////////////////////////
// Instagram: @invsionchip
// GitHub: chipinvision
// LIKE | SHARE | FOLLOW
////////////////////////////////
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer PRO',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final CountDownController _timerController = CountDownController();

  //late ConfettiController controllerTopCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;

  void initController() {
    //controllerTopCenter = ConfettiController(duration: const Duration(seconds: 1));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void initState(){
    super.initState();
    setState(() {
      initController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242132),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
                'Timer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff746CFE),
              ),
            ),
            Text(
              'PRO',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffFEFCFF),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              maximumSize: const Size(30, 30),
              shouldLoop: false,
              confettiController: _controllerCenterLeft,
              blastDirection: pi,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 20, // set a lower max blast force
              minBlastForce: 8, // set a lower min blast force
              emissionFrequency: 1,
              gravity: 1,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              maximumSize: const Size(30, 30),
              shouldLoop: false,
              confettiController: _controllerCenterRight,
              blastDirection: pi,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 20, // set a lower max blast force
              minBlastForce: 8, // set a lower min blast force
              emissionFrequency: 1,
              gravity: 1,
            ),
          ),
          Center(
            child: NeonCircularTimer(
              onComplete: (){
                _controllerCenterLeft.play();
                _controllerCenterRight.play();
              },
              width: 200,
              duration: 10,
              isReverseAnimation: true,
              controller: _timerController,
              isTimerTextShown: true,
              autoStart: false,
              neumorphicEffect: true,
              backgroudColor: const Color(0xff242132),
              textStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xffFEFCFF),
              ),
              initialDuration: 0,
              innerFillGradient: const LinearGradient(
                  colors: [
                    Color(0xff746CFE),
                    Color(0xffAE8CFA),
                  ],
              ),
              neonGradient: const LinearGradient(
                colors: [
                  Color(0xff746CFE),
                  Color(0xffAE8CFA),
                ],
              ),
              neon: 5,
              strokeWidth: 15,
              textFormat: TextFormat.HH_MM_SS,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    _timerController.resume();
                  },
                  backgroundColor: const Color(0xff746CFE),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 24,
                  ),
                ),
                FloatingActionButton(
                  onPressed: (){
                    _timerController.pause();
                  },
                  backgroundColor: const Color(0xff746CFE),
                  child: const Icon(
                    Icons.pause,
                    size: 24,
                  ),
                ),
                FloatingActionButton(
                  onPressed: (){
                    _timerController.restart();
                    _controllerCenterLeft.stop();
                    _controllerCenterRight.stop();
                  },
                  backgroundColor: const Color(0xff746CFE),
                  child: const Icon(
                    Icons.restart_alt,
                    size: 24,
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
