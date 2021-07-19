import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: MyAppStateful(),
        ),
      ),
    );
  }
}

class MyAppStateful extends StatefulWidget {
  const MyAppStateful({Key? key}) : super(key: key);

  @override
  _MyAppStatefulState createState() => _MyAppStatefulState();
}

class _MyAppStatefulState extends State<MyAppStateful> {
  void PlayButton(int number) {
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Widget funButton(int number, Color color) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => color),
        ),
        onPressed: () {
          PlayButton(number);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        funButton(1, Colors.red),
        funButton(2, Colors.orange),
        funButton(3, Colors.yellow),
        funButton(4, Colors.green.shade800),
        funButton(5, Colors.green.shade400),
        funButton(6, Colors.blue),
        funButton(7, Colors.purple),
      ],
    );
  }
}
