import 'package:flutter/material.dart';
import 'dart:math';

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

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1454177697940-c43d9f9a7307?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            backgroundBlendMode: BlendMode.color,
          ),
        ),
      ],
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
  bool _cardOrientation = true;
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
        child: CardFront(
          cardName: _cardName,
          cardOrientation: _cardOrientation,
        ),
      ),
    );
  }
}

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
// TODO: show card back on first load when not clicked yet