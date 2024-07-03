import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YouWin extends StatelessWidget {
  const YouWin({
    super.key,
    required this.restart,
    required this.num1,
    required this.num2,
    required this.score1,
    required this.score2,
  });
  final void Function() restart;
  final int num1, num2, score1, score2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 150,
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
                  padding: const EdgeInsets.fromLTRB(15, 0, 75.0, 0),
                  child: Image.asset(
                    'assets/images/hand$num1.jpg',
                    scale: 4.0,
                  ),
                ),
                Image.asset(
                  'assets/images/hand$num2.jpg',
                  scale: 4.0,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('you Win',
              style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  color: Colors.green)),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              onPressed: restart,
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.black,
              ),
              label: Text(
                "Restart",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ))
        ],
      ),
    );
  }
}
