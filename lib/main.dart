import 'package:flutter/material.dart';
import 'components/tarot_app.dart';

void main() {
  runApp(
    MaterialApp(
      home: const TarotApp(),
      debugShowCheckedModeBanner: false,
      title: 'Daily Tarot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(6, 5, 12, 1),
        ),
        fontFamily: 'Playfair',
        highlightColor: const Color.fromRGBO(250, 250, 250, 1),
      ),
    ),
  );
}
