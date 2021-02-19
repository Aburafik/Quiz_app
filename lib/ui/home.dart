import 'package:flutter/material.dart';
import 'package:quizeapp/module/quizebrain.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List quize = quizer;
  int index = 0;
  int totalScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("SCORE"), Text("$totalScore / ${quize.length}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)],
            ),
          )
        ],
        backgroundColor: Colors.blueGrey.shade400,
        centerTitle: true,
        title: Text("WHAT DO YOU KNOW"),
        automaticallyImplyLeading: false,
      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Container(
                margin: EdgeInsets.all(5),
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage("images/gh.png"))),
              )),
              Container(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    quize[index].question,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // RaisedButton(
                  //     color: Colors.blueGrey.shade700,
                  //     onPressed: () {
                  //       setState(() {
                  //         prevQuestion();
                  //       });
                  //     },
                  //     child: Icon(Icons.arrow_back)),
                  RaisedButton(
                    color: Colors.blueGrey.shade700,
                    onPressed: () {
                      setState(() {
                        _checkAnswer(true, context);
                        netQuestion();
                      });
                    },
                    child: Text(
                      "TRUE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blueGrey.shade700,
                    onPressed: () {
                      setState(() {
                        _checkAnswer(false, context);
                        netQuestion();
                      });
                    },
                    child: Text(
                      "FALSE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // RaisedButton(
                  //     color: Colors.blueGrey.shade700,
                  //     onPressed: () {
                  //       setState(() {
                  //         netQuestion();
                  //       });
                  //     },
                  //     child: Icon(Icons.arrow_forward)),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  netQuestion() {
    setState(() {
      index = (index + 1) % quize.length;
    });
  }

  prevQuestion() {
    setState(() {
      index = (index - 1) % quize.length;
    });
  }

  _checkAnswer(bool answer, BuildContext context) {
    if (answer == quize[index].isCorrect) {
      totalScore++;

      if (totalScore == quize.length) {
        setState(() {
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Congrats!'),
              content: Container(
                height: 70,
                child: Column(
                  children: [
                    Text('You have have won 5 stars'),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 40),
                        Icon(Icons.star, color: Colors.yellow, size: 40),
                        Icon(Icons.star, color: Colors.yellow, size: 40),
                        Icon(Icons.star, color: Colors.yellow, size: 40),
                        Icon(Icons.star, color: Colors.yellow, size: 40),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      totalScore = 0;
                    });
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        });
      }
      final snackbar = SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Text('Corect'));

      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text('Incorrect'));

      Scaffold.of(context).showSnackBar(snackbar);
    }
  }
}
