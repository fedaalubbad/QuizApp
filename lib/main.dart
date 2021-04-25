import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      //remove debug banner
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
Color w=Colors.white;
Color b=Colors.black;
class _MyHomePageState extends State<MyHomePage> {
  int _questionIndex = 0;
  int _totalScore = 0;
  int num0=0, num1=0,num2=0;
  bool isSwitched=false;

  final  List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text':'red', 'score' : 10},
        {'text':'yellow', 'score' :20} ,
        {'text':'blue', 'score' : 30},
        {'text':'black', 'score' :40}
        ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text':'rabbit', 'score' : 10} ,
        {'text': 'lion', 'score' : 20} ,
        {'text':'tiger', 'score' : 30} ,
        {'text':'elephant', 'score' : 40}
        ]
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
         {'text':'fedaa1', 'score' : 10} ,
         {'text':'fedaa2', 'score' : 20} ,
         {'text':'fedaa3', 'score' : 30},
         {'text':'fedaa4', 'score' : 40}
         ]
    },
  ];
   void resetIndex(){
     setState(() {
       _questionIndex=0;
       _totalScore=0;
            num0=0;
            num1=0;
            num2=0;
     });
   }
  void _answerQuestion(int score) {
     if(_questionIndex==0){
       num0=score;
     }else if(_questionIndex==1){
       num1=score;

     }else if(_questionIndex==2){
       num2=score;

     }


    _totalScore+=score;
    setState(() {
      _questionIndex += 1;
    });
//    print(_totalScore);
//    print("answer chosen!");
//    print("question$_questionIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ,style: TextStyle(color: w),),
        actions: <Widget>[
          Switch(
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.grey,
            activeColor: Colors.white,
            value: isSwitched,
            onChanged: (value){
              setState(() {
                isSwitched=value;
                 if(isSwitched==true) {w=Colors.black; b=Colors.white;}
                 if(isSwitched==false){ w=Colors.white; b=Colors.black;}
              });
            },
          )
        ],
      ),
      body: Container(
          padding:EdgeInsets.all(5),
          color: w,
        width: double.infinity,
        child: _questionIndex<_questions.length
            ? Quiz(_questions,_questionIndex,_answerQuestion)
            :Result(_totalScore,resetIndex)

    ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.arrow_back,color: w,),
        onPressed:() {
          if(_questionIndex>0) {
            if (_questionIndex == 1) _totalScore -= num0;
            if (_questionIndex == 2) _totalScore -= num1;
            if (_questionIndex == 3) _totalScore -= num2;
            setState(() {
              _questionIndex --;
            });
          }
        }
      )
    );
  }
}
