import 'package:flutter/material.dart';
import './gridCell.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  //audioPlayer
  AudioCache audioCache = new AudioCache();

  int flag = 0;
  int turn = 0;

  int output = 1;
  void diceChanges() {
    setState(() {
      flag = 0;
      output = 1 + Random().nextInt(6);
    });
  }

  int sixCount = 0;
  void changes() {
    if (output == 6 && sixCount <= 3) {
      turn = turn;
      sixCount++;
    } else {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          sixCount = 0;
          flag = 0;
          turn = (turn + 1) % 4;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget getCell(int i, int j, int flag) {
      return GridCell(i: i, j: j, flag: flag);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        SizedBox.expand(
          child: Container(
            color: Color(0xff1f0d67),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 10),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: (turn == 0)
                        ? Container(
                            color: Colors.blue,
                            child: GestureDetector(
                              child: Image.asset("asset/dice${output}.jpg"),
                              onTap: () {
                                audioCache.play("asset/roll.wav");
                                diceChanges();
                                changes();
                              },
                            ),
                          )
                        : Opacity(
                            opacity: 0.2,
                            child: Container(
                              child: Image.asset("asset/dice${output}.jpg"),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: 270,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: (turn == 1)
                        ? Container(
                            color: Colors.blue,
                            child: GestureDetector(
                                child: Image.asset("asset/dice${output}.jpg"),
                                onTap: () {
                                  audioCache.play("asset/roll.wav");
                                  diceChanges();
                                  changes();
                                }))
                        : Opacity(
                            opacity: 0.2,
                            child: Container(
                              child: Image.asset("asset/dice${output}.jpg"),
                            ),
                          ),
                  )
                ],
              ),
            ),
            Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: GridView.count(
                      crossAxisCount: 15,
                      children: List.generate(
                        225,
                        (k) => getCell(k ~/ 15, k % 15, flag++),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: (turn == 3)
                        ? Container(
                            color: Colors.blue,
                            child: GestureDetector(
                                child: Image.asset("asset/dice${output}.jpg"),
                                onTap: () {
                                  audioCache.play("asset/roll.wav");
                                  diceChanges();
                                  changes();
                                }))
                        : Opacity(
                            opacity: 0.2,
                            child: Container(
                              child: Image.asset("asset/dice${output}.jpg"),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: 270,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: (turn == 2)
                        ? Container(
                            color: Colors.blue,
                            child: GestureDetector(
                                child: Image.asset("asset/dice${output}.jpg"),
                                onTap: () {
                                  audioCache.play("asset/roll.wav");
                                  diceChanges();
                                  changes();
                                }))
                        : Opacity(
                            opacity: 0.2,
                            child: Container(
                              child: Image.asset("asset/dice${output}.jpg"),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
