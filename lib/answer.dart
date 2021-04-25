import 'package:flutter/material.dart';
import 'main.dart';

class Answer extends StatelessWidget {
  final answerText;
  final Function x;
  const Answer( this.answerText,this.x);
  @override
  Widget build(BuildContext context) {
    return     Container(
        width: double.infinity,
        child:RaisedButton(
          color: Colors.deepPurple,
          textColor: w,
          onPressed:x,
          child: Text(answerText,style: TextStyle(fontSize: 18),),
        )
    );
  }
}
