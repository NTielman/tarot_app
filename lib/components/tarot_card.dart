import 'package:flutter/material.dart';
import 'card_back.dart';
import 'card_front.dart';
import 'card_placeholder.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

String apiUrl = 'https://tarot-api-3hv5.onrender.com/api/v1/cards/random?n=1';

class TarotCard extends StatefulWidget {
  const TarotCard({super.key});

  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  // Widget cardChild = const CardBack();
  Widget cardChild = const CardPlaceHolder();
  final AudioPlayer player = AudioPlayer();

  void _handleTap() async {
    await player.play(AssetSource('card-flip.wav'));

    try {
      http.Response res = await http.get(Uri.parse(apiUrl));
      if (res.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(res.body);
        var randCard = jsonResponse['cards'][0];

        setState(() {
          cardChild = CardFront(
            cardName: '${randCard['name_short']}',
            cardOrientation: Random().nextBool(),
          );
        });
      } else {
        setState(() {
          cardChild = const CardPlaceHolder();
        });
        throw ('Request failed with status: ${res.statusCode}');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(),
      child: SizedBox(
        width: 290.0,
        height: 460.0,
        child: cardChild,
      ),
    );
  }
}

// TODO: longpress card should display card modal with info?
// TODO: hide card or show loasding if no card