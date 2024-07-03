import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModeButton extends StatelessWidget {
  const ModeButton(
      {super.key,
      required this.text,
      required this.level,
      required this.color});
  final String text;
  final void Function() level;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: level,
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          backgroundColor: color),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
