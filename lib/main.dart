import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    const MaterialApp(
      home: TarotApp(),
      debugShowCheckedModeBanner: false,
      title: 'Daily Tarot',
    ),
  );
}

class TarotApp extends StatelessWidget {
  const TarotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Tarot'),
      ),
      body: const Center(
        child: TarotCard(),
      ),
    );
  }
}

class TarotCard extends StatefulWidget {
  const TarotCard({super.key});

  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  String _cardName = 'pe02';
  final List<String> _cardTypes = ['ar', 'cu', 'pe', 'sw', 'wa'];
  final List<String> _arcanaValues = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
  ];
  final List<String> _cardValues = [
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    'ac',
    'ki',
    'kn',
    'pa',
    'qu'
  ];

  void _handleTap() {
    String suite = _cardTypes[Random().nextInt(_cardTypes.length)];
    String value = suite == 'ar'
        ? _arcanaValues[Random().nextInt(_arcanaValues.length)]
        : _cardValues[Random().nextInt(_cardValues.length)];

    setState(() {
      _cardName = '$suite$value';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(),
      child: SizedBox(
        width: 290.0,
        height: 460.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 10.0,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/$_cardName.jpg',
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
              ),
              border: Border.all(
                width: 5.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// TODO: add static card "back"image
// TODO:change orientation randomly
// TODO: style to look like tarot app
