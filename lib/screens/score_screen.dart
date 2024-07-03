import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rockpaperscissors/buttons/modebutton.dart';

int maxscore = 0;

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key, required this.back, required this.start});
  final void Function() back;
  final void Function() start;

  @override
  State<StatefulWidget> createState() {
    return ScoreScreenState();
  }
}

class ScoreScreenState extends State<ScoreScreen> {
  void increase() {
    setState(() {
      maxscore++;
    });
  }

  void decrease() {
    setState(() {
      maxscore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(children: [
            Text('Play till what score?',
                style: GoogleFonts.dancingScript(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            TextButton(
                onPressed: () {
                  if (maxscore > 0) {
                    decrease();
                  }
                },
                child: const Text(
                  '-',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Text(
              '$maxscore',
              style: const TextStyle(fontSize: 30),
            ),
            TextButton(
                onPressed: () {
                  if (maxscore < 10) {
                    increase();
                  }
                },
                child: const Text(
                  '+',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
          ]),
        ),
        const SizedBox(
          height: 40,
        ),
        ModeButton(
            text: 'Confirm Score', level: widget.start, color: Colors.green),
        const SizedBox(
          height: 30,
        ),
        ModeButton(text: 'back', level: widget.back, color: Colors.green)
      ],
    );
  }
}
