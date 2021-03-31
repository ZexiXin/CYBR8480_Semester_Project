import 'package:flutter/material.dart';

const kTileDefaultBackgroundColor = Colors.white;
const kTileDefaultTextColor = Color(0xFF0A2F47);
const kTileDefaultBorderColor = Color(0xFFE8EAEE);

const kSwatchBlueColor = Color(0xFF52BEFF);
const kSwatchPinkColor = Color(0xFFFE385E);

class NumberTile extends StatelessWidget {
  final Color textColor;
  final String content;

  NumberTile(
      {
    @required this.textColor,
    @required this.content
      }
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: kTileDefaultBorderColor,
            style: BorderStyle.solid,
            width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
        color: kTileDefaultBackgroundColor,
      ),
      child: Text(
        this.content ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: this.textColor,
        ),
      ),
    );
  }
}

class HydrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSwatchBlueColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'cups',
              child: Icon(
                Icons.opacity,
                size: 80.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Hydration',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
            Text(
              '4 of 12',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: NumberTile(
                            content: '1',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '2',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '3',
                            textColor: kTileDefaultTextColor,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: NumberTile(
                            content: '4',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '5',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '6',
                            textColor: kTileDefaultTextColor,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: NumberTile(
                            content: '7',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '+',
                            textColor: kSwatchBlueColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '',
                            textColor: kTileDefaultTextColor,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: NumberTile(
                            content: '',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '',
                            textColor: Colors.blue,
                          )
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: NumberTile(
                            content: '',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: NumberTile(
                            content: '',
                            textColor: kTileDefaultTextColor,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context
                                );
                              },
                              child: NumberTile(
                                content: 'back',
                                textColor: Colors.blue,
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}