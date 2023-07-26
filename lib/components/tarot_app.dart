import 'package:flutter/material.dart';
import 'background_image.dart';
import 'tarot_card.dart';

class TarotApp extends StatelessWidget {
  const TarotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Tarot',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: const Stack(
        children: [
          BackgroundImage(),
          Center(
            child: TarotCard(),
          ),
        ],
      ),
    );
  }
}
