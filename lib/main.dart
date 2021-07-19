import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

/*
    final player = AudioCache();
    player.play('note$number.wav');

* */

void main() => runApp(PlayInStateless());

class PlayInStateless extends StatelessWidget {
  const PlayInStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ChangerColor(),
        ),
      ),
    );
  }
}

class ChangerColor extends StatefulWidget {
  const ChangerColor({Key? key}) : super(key: key);

  @override
  _ChangerColorState createState() => _ChangerColorState();
}

class _ChangerColorState extends State<ChangerColor> {
  ColorMusic randomColorMusic() {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.grey,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.brown,
      Colors.purple,
      Colors.white,
    ];
    ColorMusic cM = ColorMusic(
        colors[Random().nextInt(10)], "note${Random().nextInt(7) + 1}.wav");
    return cM;
  }

  Widget expandedMusicButton() {
    ColorMusic cM = randomColorMusic();
    return Expanded(
      child: TextButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(cM.color)),
        onPressed: () {
          setState(() {
            final play = AudioCache();
            play.play(cM.theNote!);
          });
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [expandedMusicButton()],
    );
  }
}

class ColorMusic {
  Color? color;
  String? theNote;

  ColorMusic(Color color, String theNote) {
    this.color = color;
    this.theNote = theNote;
  }
}
