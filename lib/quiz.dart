import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final int questionIndex;
  final  Function answerQuestion;

  const Quiz(this.questionList, this.questionIndex, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(
      children: <Widget>[
        Question(questionList[questionIndex]['questionText']),
        ...(questionList[questionIndex]['answers'] as List<Map<String,Object>>).map((answer){
          return Answer(answer['text'],()=>{answerQuestion(answer['score'],)});
        }).toList(),

      ],
    )
    );
  }
}