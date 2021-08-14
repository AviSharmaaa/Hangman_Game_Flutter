import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kPrimeColor = Colors.grey[850];

final kPrimeTextTheme = GoogleFonts.lobster(
    fontSize: 55,
    fontWeight: FontWeight.w500,
    foreground: Paint()..shader = textGradient,
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

final Shader textGradient = LinearGradient(
  colors: <Color>[Color(0xff6c72cb), Color(0xffcb69c1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

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

final hangmanProgress = [
  AssetImage("assets/images/hang5.png"),
  AssetImage("assets/images/hang4.png"),
  AssetImage("assets/images/hang3.png"),
  AssetImage("assets/images/hang2.png"),
  AssetImage("assets/images/hang0.png")
];
