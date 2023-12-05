// create a placeholder widget with loading animation
import 'package:flutter/material.dart';

class CardPlaceHolder extends StatelessWidget {
  const CardPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff2b2b2b),
          Color(0xff1e1e1e),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }
}
