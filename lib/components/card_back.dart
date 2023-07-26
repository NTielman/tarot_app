import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  const CardBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Color(0xff2b2b2b)),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1, -1),
              end: Alignment(-0.5, -0.8),
              colors: [
                Colors.black,
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
              stops: [0.0, 0.25, 0.25, 0.75, 0.75],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1, -1),
              end: Alignment(0.5, -0.8),
              colors: [
                Color(0xff1e1e1e),
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Color(0xff1e1e1e),
              ],
              stops: [0.0, 0.25, 0.25, 0.75, 0.75],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-1, -1),
              end: const Alignment(-0.5, -0.8),
              colors: [
                const Color(0xffb1b1b1).withOpacity(0.7),
                Colors.transparent,
              ],
              stops: const [0, 0.02],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(1, -1),
              end: const Alignment(0.5, -0.8),
              colors: [
                const Color(0xffb1b1b1).withOpacity(0.7),
                Colors.transparent,
              ],
              stops: const [0, 0.02],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
      ],
    );
  }
}
