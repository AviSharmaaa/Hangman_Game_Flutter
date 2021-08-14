import 'package:flutter/material.dart';
import 'timer_mode.dart';
import '../constants.dart';
import 'easy_mode.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25),
        color: kPrimeColor,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "HANG MAN",
                    style: kPrimeTextTheme,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/grim_reaper.png"),
                    ),
                  ),
                ),
              ),
              actionButton(context, "EASY", EasyGame(), 30.0),
              actionButton(context, "TIMER", TimerGame(), 50.0),
            ],
          ),
        ),
      ),
    );
  }

  actionButton(BuildContext context, buttonText, path, topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => path));
        },
        child: Text(
          buttonText,
          style: kSecondText,
        ),
      ),
    );
  }
}
