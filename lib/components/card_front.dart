import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  final String cardName;
  final bool cardOrientation;

  const CardFront({
    super.key,
    required this.cardName,
    required this.cardOrientation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 10.0,
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 50,
            color: Color.fromRGBO(6, 6, 5, 0.5),
          ),
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 2,
            color: Color.fromRGBO(6, 6, 5, 0.25),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/$cardName.jpg',
            ),
            fit: BoxFit.cover,
            alignment:
                cardOrientation ? Alignment.topLeft : Alignment.bottomRight,
          ),
          border: Border.all(
            width: 5.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
