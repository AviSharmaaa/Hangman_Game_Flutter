import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimeColor = Color(0xFF421b9b);

final kPrimeTextTheme = GoogleFonts.patrickHand(
    fontSize: 55,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    letterSpacing: 3.0);

final kSecondText = GoogleFonts.lobster(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white,
    letterSpacing: 3.0);

final kLetterText = GoogleFonts.patrickHand(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final kHintIcon = Icon(
  Icons.lightbulb,
  color: Colors.yellow,
  size: 25,
);

const List<String> alphabet = const [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

String words = "";

List<String>? word;

var wordToGuess = <String>[];

var nosOfGuesses = 5;

String alertBoxWord = "";

var wordsMatched = 0;

String verdict = "";

int hint = 0;

final hangmanProgress = [
  AssetImage("assets/images/hang5.png"),
  AssetImage("assets/images/hang4.png"),
  AssetImage("assets/images/hang3.png"),
  AssetImage("assets/images/hang2.png"),
  AssetImage("assets/images/hang0.png")
];
