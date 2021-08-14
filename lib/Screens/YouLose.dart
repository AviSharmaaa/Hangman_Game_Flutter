import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_game/constants.dart';

class YouLose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "You Lose",
                  style: GoogleFonts.lobster(
                      fontSize: 55,
                      fontWeight: FontWeight.w500,
                      foreground: Paint()..shader = textGradient,
                      letterSpacing: 3.0),
                ),
              ),
              Container(
                height: 400,
                width: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/YouLose.png"),
                  ),
                ),
              ),
              actionButton(context, "PLAY AGAIN", 20.0),
              actionButton(context, "QUIT GAME", 40.0),
            ],
          ),
        ),
      ),
    );
  }

  actionButton(BuildContext context, buttonText, buttonMargin) {
    return Container(
      margin: EdgeInsets.only(top: buttonMargin),
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff6c72cb), Color(0xffcb69c1)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          if (buttonText == "PLAY AGAIN")
            Navigator.pop(context, true);
          else {
            Navigator.pop(context, false);
            Navigator.pop(context);
          }
        },
        child: Text(
          buttonText,
          style: kSecondText,
        ),
      ),
    );
  }
}
