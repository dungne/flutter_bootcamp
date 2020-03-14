import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  var nums = [1, 2, 3, 4, 5, 6, 7];
  var colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Expanded buildKey({Color color, int num}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(num);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: colors[0], num: nums[0]),
                buildKey(color: colors[1], num: nums[1]),
                buildKey(color: colors[2], num: nums[2]),
                buildKey(color: colors[3], num: nums[3]),
                buildKey(color: colors[4], num: nums[4]),
                buildKey(color: colors[5], num: nums[5]),
                buildKey(color: colors[6], num: nums[6]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
