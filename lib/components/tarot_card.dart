import 'package:flutter/material.dart';
import 'card_back.dart';
import 'card_front.dart';
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
  String _cardName = '';
  bool _cardOrientation = true;
  bool _firstTap = true;
  final AudioPlayer player = AudioPlayer();

  void _handleTap() async {
    await player.play(AssetSource('card-flip.wav'));

    try {
      http.Response res = await http.get(Uri.parse(apiUrl));
      if (res.statusCode == 200) {
        var jsonResponse = await convert.jsonDecode(res.body);
        var randCard = jsonResponse['cards'][0];

        setState(() {
          _cardName = '${randCard['name_short']}';
          _cardOrientation = Random().nextBool();
        });
      } else {
        throw ('Request failed with status: ${res.statusCode}');
      }
    } catch (error) {
      print(error);
    }

    if (_firstTap) {
      setState(() {
        _firstTap = false;
      });
    }
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
