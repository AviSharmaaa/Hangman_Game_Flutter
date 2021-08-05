import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_game/constants.dart';

class EasyGame extends StatefulWidget {
  @override
  _EasyGameState createState() => _EasyGameState();
}

class _EasyGameState extends State<EasyGame> {
  startGame() {
    Random randomWord = new Random();
    words = nouns[randomWord.nextInt(nouns.length)];
    word = words.toUpperCase().split("");
    alertBoxWord = words.toUpperCase();
    wordToGuess.clear();
    nosOfGuesses = 5;
    wordsMatched = 0;

    if (word!.length < 4) {
      hint = 1;
    } else {
      hint = 2;
    }

    for (var i = 0; i < word!.length; i++) {
      wordToGuess.add("_");
    }
    print(word);
    verdict = "";

    setState(() {
      wordToGuess.join();
    });
  }

  getHint() {
    final _random = Random();

    var _randomLetter = word![_random.nextInt(word!.length)];

    if (hint == 0) {
      showHintAlert("You have Exhausted all your hints");
    } else {
      hint -= 1;
      guessedLetter(_randomLetter);
    }
  }

  checkGameFinished() {
    wordsMatched = 0;
    for (var i = 0; i < word!.length; i++) {
      if (word![i] != wordToGuess[i]) {
        break;
      } else {
        wordsMatched += 1;
      }
    }
  }

  guessedLetter(letter) {
    setState(() {
      if (word!.contains(letter)) {
        verdict = "";
        for (var i = 0; i < word!.length; i++) {
          if (word![i] == letter) {
            wordToGuess.removeAt(i);
            wordToGuess.insert(i, letter);
            checkGameFinished();
            print(wordToGuess);
          }
        }
        if (wordsMatched == words.length) {
          Future.delayed(const Duration(milliseconds: 400), () {
            showAlertDialog("You guessed the word correctly\nThe word was");
          });
        }
      } else {
        if (nosOfGuesses == 1) {
          showAlertDialog("The word was");
        } else {
          verdict = "Wrong Guess";
          nosOfGuesses -= 1;
        }
      }
    });
  }

  Widget _renderBottomContent() {
    return Wrap(
      spacing: 2.0,
      //runSpacing: 1.0,
      alignment: WrapAlignment.center,
      children: alphabet
          .map((letter) => ElevatedButton(
                child: Text(
                  letter,
                  style: kLetterText,
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  guessedLetter(letter);
                },
              ))
          .toList(),
    );
  }

  showHintAlert(statement) {
    Widget playButton = TextButton(
      child: Text("Back"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("No More Hints Left"),
      content: Text(statement),
      actions: [
        playButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(statement) {
    Widget playButton = TextButton(
      child: Text("Play Again"),
      onPressed: () {
        startGame();
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Game Over"),
      content: Text(statement + " $alertBoxWord"),
      actions: [
        playButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 50,
                      ),
                      Text(
                        "$nosOfGuesses",
                        style: kSecondText,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.lightbulb,
                        color: Colors.yellow,
                      ),
                      onTap: () {
                        getHint();
                      },
                    ),
                    Text(
                      "$hint",
                      style: GoogleFonts.lobster(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text("START GAME"),
                  onPressed: () {
                    startGame();
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                color: Colors.white,
                height: 200,
                width: 240,
                image: hangmanProgress[nosOfGuesses - 1],
              ),
            ),
          ),
          Container(
            height: 90,
            width: double.infinity,
            child: Center(
              child: Text(wordToGuess.join(), style: kSecondText),
            ),
          ),
          Container(
            child: Text(
              verdict,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: kPrimeColor,
            child: _renderBottomContent(),
          ),
        ],
      ),
    );
  }
}
