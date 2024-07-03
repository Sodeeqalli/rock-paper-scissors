import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rockpaperscissors/buttons/modebutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rockpaperscissors/screens/score_screen.dart';

import 'package:rockpaperscissors/screens/you_lose.dart';
import 'package:rockpaperscissors/screens/you_win.dart';

class NormalMode extends StatefulWidget {
  const NormalMode({super.key, required this.back, required this.restart});
  final void Function() back;
  final void Function() restart;

  @override
  State<StatefulWidget> createState() {
    return _NormalModeState();
  }
}

class _NormalModeState extends State<NormalMode> {
  int max = maxscore;
  int num1 = 1;
  int num2 = 5;
  int aiNum = 0;
  int score2 = 0;
  int score1 = 0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    if (score1 == max) {
      return YouWin(
        restart: () => widget.restart(),
        num1: num1,
        num2: num2,
        score1: score1,
        score2: score2,
      );
    } else if (score2 == max) {
      return YouLose(
        restart: () => widget.restart(),
        num1: num1,
        num2: num2,
        score1: score1,
        score2: score2,
      );
    } else {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 270.0, 0.0),
                child: ElevatedButton.icon(
                  onPressed: widget.back,
                  icon: const Icon(Icons.arrow_left_outlined),
                  label: const Text(
                    'Back',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: const [
                  Text(
                    'You',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 220,
                  ),
                  Text(
                    'AI',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '$score1',
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 280,
                    ),
                    Text(
                      '$score2',
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 70.0, 0),
                      child: Image.asset(
                        'assets/images/hand$num1.png',
                        scale: 4.0,
                      ),
                    ),
                    Image.asset(
                      'assets/images/hand$num2.png',
                      scale: 4.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: ModeButton(
                              text: 'Rock',
                              level: () {
                                aiNum = random.nextInt(2) + 3;
                                if (aiNum == 4) {
                                  setState(() {
                                    num1 = 1;
                                    num2 = aiNum;
                                    score1++;
                                  });
                                } else if (aiNum == 3) {
                                  setState(() {
                                    num1 = 1;
                                    num2 = aiNum;
                                    score2++;
                                  });
                                } else if (aiNum == 5) {
                                  setState(() {
                                    num1 = 1;
                                    num2 = aiNum;
                                  });
                                }
                              },
                              color: Colors.brown)),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ModeButton(
                            text: 'Paper',
                            level: () {
                              aiNum = random.nextInt(2) + 3;
                              if (aiNum == 4) {
                                setState(() {
                                  num1 = 3;
                                  num2 = aiNum;
                                  score2++;
                                });
                              } else if (aiNum == 3) {
                                setState(() {
                                  num1 = 3;
                                  num2 = aiNum;
                                });
                              } else if (aiNum == 5) {
                                setState(() {
                                  num1 = 3;
                                  num2 = aiNum;
                                  score1++;
                                });
                              }
                            },
                            color: Colors.brown),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ModeButton(
                            text: 'Scissors',
                            level: () {
                              aiNum = random.nextInt(2) + 3;
                              if (aiNum == 4) {
                                setState(() {
                                  num1 = 2;
                                  num2 = aiNum;
                                });
                              } else if (aiNum == 3) {
                                setState(() {
                                  num1 = 2;
                                  num2 = aiNum;
                                  score1++;
                                });
                              } else if (aiNum == 5) {
                                setState(() {
                                  num1 = 2;
                                  num2 = aiNum;
                                  score2++;
                                });
                              }
                            },
                            color: Colors.brown),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Text('Normal Mode',
                  style: GoogleFonts.dancingScript(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 27, 0, 123)))
            ],
          ),
        ),
      );
    }
  }
}
