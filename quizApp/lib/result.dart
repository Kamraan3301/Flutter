import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './main.dart';

import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it';
    if (resultScore >= 800) {
      resultText = 'You have good Knowledge in gaming';
      print(resultScore);
    } else if (resultScore < 800 && resultScore > 300) {
      resultText = 'You have low Knowledge in gaming';
      print(resultScore);
    } else {
      resultText = 'You are dumb';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //colon ta else er moto kaj kore after column
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz'),
            style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
