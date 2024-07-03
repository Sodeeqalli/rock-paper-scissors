import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.start});
  final void Function() start;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 140),
        Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: Image.asset(
                'assets/images/rps.jpg',
                cacheHeight: 400,
              ),
            ),
          ),
          Column(children: [
            Text('Rock',
                style: GoogleFonts.dancingScript(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            Text('Paper',
                style: GoogleFonts.dancingScript(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 104, 0, 0))),
            Text('Scissors',
                style: GoogleFonts.dancingScript(
                    fontSize: 50, fontWeight: FontWeight.bold))
          ])
        ]),
        const SizedBox(height: 20),
        TextButton.icon(
            onPressed: start,
            icon: const Icon(
              Icons.start_outlined,
              color: Colors.black,
            ),
            label: const Text(
              'Play',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ))
      ],
    );
  }
}
