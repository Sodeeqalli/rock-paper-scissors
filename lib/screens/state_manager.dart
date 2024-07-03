import 'package:flutter/material.dart';
import 'package:rockpaperscissors/screens/impossible_mode.dart';
import 'package:rockpaperscissors/screens/normal_mode.dart';
import 'package:rockpaperscissors/screens/score_screen.dart';
import 'package:rockpaperscissors/screens/start_screen.dart';
import 'package:rockpaperscissors/screens/level_screen.dart';
import 'easy_mode.dart';

class RockApp extends StatefulWidget {
  const RockApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return RockAppState();
  }
}

class RockAppState extends State<RockApp> {
  var currentscreen = 'start_screen';
  int level = 0;
  int score = 0;

  void startscreen() {
    setState(() {
      currentscreen = 'start_screen';
    });
  }

  void startgame() {
    setState(() {
      currentscreen = 'level-screen';
    });
  }

  void back() {
    setState(() {
      currentscreen = 'level-screen';
      maxscore = 0;
      level = 0;
    });
  }

  void easy() {
    setState(() {
      currentscreen = 'score-screen';
      level = 1;
    });
  }

  void normal() {
    setState(() {
      currentscreen = 'score-screen';
      level = 2;
    });
  }

  void impossible() {
    setState(() {
      currentscreen = 'score-screen';
      level = 3;
    });
  }

  void youwin() {
    setState(() {
      currentscreen = 'you-win';
    });
  }

  void start() {
    if (level == 1 && maxscore > 0) {
      setState(() {
        currentscreen = 'easy-mode';
        score = maxscore;
      });
    } else if (level == 2 && maxscore > 0) {
      setState(() {
        currentscreen = 'normal-mode';
        score = maxscore;
      });
    } else if (level == 3 && maxscore > 0) {
      setState(() {
        currentscreen = 'impossible-mode';
        score = maxscore;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(
      start: startgame,
    );

    if (currentscreen == 'level-screen') {
      activeScreen = LevelScreen(
        easy: easy,
        normal: normal,
        impossible: impossible,
        back: startscreen,
      );
    } else if (currentscreen == 'score-screen') {
      activeScreen = ScoreScreen(
        back: startgame,
        start: start,
      );
    } else if (currentscreen == 'easy-mode') {
      activeScreen = EasyMode(
        restart: back,
        back: back,
      );
    } else if (currentscreen == 'normal-mode') {
      activeScreen = NormalMode(
        restart: back,
        back: back,
      );
    } else if (currentscreen == 'impossible-mode') {
      activeScreen = ImpossibleMode(
        back: back,
        restart: back,
      );
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(186, 255, 255, 255),
            Color.fromARGB(194, 255, 255, 255)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Center(
          child: activeScreen,
        ),
      )),
    );
  }
}
