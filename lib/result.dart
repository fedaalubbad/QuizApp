import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final resultScore;
  final Function resetindex;
  const Result(this.resultScore,this.resetindex);
  String get resultPhrase{
    String resultText;
    if(resultScore>=70){
      resultText="you are very good!";
    }else if(resultScore>=40){
      resultText="you are good!";

    }else{
      resultText="you are so bad!";

    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("your Score is : $resultScore"
          ,style: TextStyle(color:b,fontSize: 20),
          textAlign: TextAlign.center,),

        Text(resultPhrase
          ,style: TextStyle(color: b,fontSize: 30),
          textAlign: TextAlign.center,),

        FlatButton(
            child: Text('restart the test',style: TextStyle(color: Colors.blue,fontSize: 25),),
            onPressed: resetindex
        )
      ],
    ),
    );
  }
}