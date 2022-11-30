import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizapp/quiz.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String url = "https://opentdb.com/api.php?amount=10";
  Quiz quiz;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decRes = jsonDecode(res.body);
    quiz = Quiz.fromJson(decRes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: quiz != null
          ? ListView.builder(
              itemCount: quiz.results.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayPage(
                                  question: quiz.results[index].question,
                                  correctAnswer: quiz.results[index].correctAnswer,
                                  incorrectAnswers:
                                      quiz.results[index].incorrectAnswers,
                                )));
                  },
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        quiz.results[index].question,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}






