import 'dart:async';
import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hangman_game/constants.dart';

class TimerGame extends StatefulWidget {
  @override
  _TimerGameState createState() => _TimerGameState();
}

class _TimerGameState extends State<TimerGame> {
  Timer? _timer;

  int _startCountDown = 0;

  startTimer() {
    _startCountDown = 60;
    const onSec = const Duration(seconds: 1);
    if (_timer != null) {
      _timer!.cancel();
      _startCountDown = 60;
    }

    _timer = new Timer.periodic(
      onSec,
      (Timer timer) {
        if (_startCountDown == 0) {
          setState(() {
            timer.cancel();
          });
          showAlertDialog("You ran out of Time\nThe word was ");
        } else {
          setState(() {
            _startCountDown--;
          });
        }
      },
    );
  }

  startGame() {
    Random randomWord = new Random();
    words = nouns[randomWord.nextInt(nouns.length)];
    word = words.toUpperCase().split("");
    alertBoxWord = words.toUpperCase();
    wordToGuess.clear();
    nosOfGuesses = 5;
    wordsMatched = 0;
    startTimer();

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
  void initState() {
    super.initState();
    startGame();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Container(
                          child: Text(
                            "$_startCountDown",
                            style: GoogleFonts.lobster(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      kHintIcon,
                      Text(
                        "$hint",
                        style: GoogleFonts.lobster(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    getHint();
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
