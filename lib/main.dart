import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(),
    );
  }
}

class Question {
  String question;
  bool correctAnswer;  // Constructor
  Question(this.question, this.correctAnswer);
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final tickIcon = Icon(Icons.check_circle,color: Colors.green,size: 30,);
  final crossIcon = Icon(Icons.cancel,color: Colors.red,size: 30,);
  List<Icon> iconsList = [];
  int counter = 0;
  //List of Questions
  final List<Question> questionsList = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[counter].correctAnswer) {
      //Correct answer

      setState(() {
        iconsList.add(tickIcon);

        // Check if don't cross list size limit which will result in error
        if (counter < questionsList.length - 1) counter++;
      });
    } else {
      //Incorrect answer
      setState(() {
        iconsList.add(crossIcon);

        // Check if don't cross list size limit which will result in error
        if (counter < questionsList.length - 1) counter++;
      });
    }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text('The Quizz App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              color: Colors.deepPurple[400],
                child: Padding(padding: EdgeInsets.all(40.0),child: Text(questionsList[counter].question,style:TextStyle(fontSize:30,color: Colors.white,fontWeight: FontWeight.bold, ),),)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton.extended(
                    label: Text('True',style: TextStyle(fontSize: 30),),
                    icon: Icon(Icons.check_circle_outline),
                    backgroundColor: Colors.green[700],
                    onPressed: () {
                      _checkAnswer(true);
                    }),
                FloatingActionButton.extended(
                  label: Text('False',style: TextStyle(fontSize: 30),),
                  icon: Icon(Icons.highlight_off),
                  backgroundColor: Colors.red[700],
                  onPressed: () {
                    _checkAnswer(false);
                  },
                ),
              ],
            ),

          ],
        ),),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple[900],
        child: Row(
          
            children: iconsList
        ),
      ),
    );



  }
}


