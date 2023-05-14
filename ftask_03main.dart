import 'package:flutter/material.dart';

class Cards {
  String category;
  String question;
  String answer;

  Cards({required this.category, required this.question, required this.answer});
}

void main() {
  var questions = [
    Cards(
        category: "Sports",
        question: "¿What is one of the newest Olympic sports that exist?",
        answer: "test"),
    Cards(
        category: "Comics",
        question: "¿Who is a latinamerican DC villain?",
        answer: "test"),
    Cards(
        category: "Tech",
        question: "¿What is the best programming langauge to create apps?",
        answer: "test"),
  ];
  runApp(MyApp(questions: questions));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.questions,
  });

  final List<Cards> questions;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      home: Home(questions: questions),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.questions}) : super(key: key);

  final List<Cards> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Trivia Maker 1.0"),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          final card = questions[index];
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 45,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(card.answer),
                      ),
                    );
                  },
                  child: Container(
                    width: 300,
                    color: Colors.tealAccent,
                    child: Column(
                      children: [
                        Text(
                          card.category,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          card.question,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
