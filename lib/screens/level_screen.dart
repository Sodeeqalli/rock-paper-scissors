import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rockpaperscissors/buttons/modebutton.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen(
      {super.key,
      required this.easy,
      required this.normal,
      required this.impossible,
      required this.back});
  final void Function() easy;
  final void Function() normal;
  final void Function() impossible;
  final void Function() back;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/rps.png',
                scale: 3.0,
              ),
              const SizedBox(
                width: 100,
              ),
              ElevatedButton(
                onPressed: back,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: Colors.red),
                child: const Text(
                  'back',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            margin: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text('Pick a mode',
                    style: GoogleFonts.dancingScript(
                        fontSize: 50, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ModeButton(
                        text: ' Easy Mode', level: easy, color: Colors.green)),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ModeButton(
                      text: 'Normal Mode', level: normal, color: Colors.yellow),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ModeButton(
                      text: 'Impossible Mode',
                      level: impossible,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
