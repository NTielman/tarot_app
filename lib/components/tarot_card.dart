import 'package:flutter/material.dart';
import 'card_back.dart';
import 'card_front.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class TarotCard extends StatefulWidget {
  const TarotCard({super.key});

  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  String _cardName = '';
  bool _cardOrientation = true;
  bool _firstTap = true;
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
  final AudioPlayer player = AudioPlayer();

  void _handleTap() async {
    await player.play(AssetSource('card-flip.wav'));
    if (_firstTap) {
      setState(() {
        _firstTap = false;
      });
    }

    String suite = _cardTypes[Random().nextInt(_cardTypes.length)];
    String value = suite == 'ar'
        ? _arcanaValues[Random().nextInt(_arcanaValues.length)]
        : _cardValues[Random().nextInt(_cardValues.length)];

    setState(() {
      _cardName = '$suite$value';
      _cardOrientation = Random().nextBool();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(),
      child: SizedBox(
        width: 290.0,
        height: 460.0,
        child: _firstTap
            ? const CardBack()
            : CardFront(
                cardName: _cardName,
                cardOrientation: _cardOrientation,
              ),
      ),
    );
  }
}
