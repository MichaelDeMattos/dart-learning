import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Quiz App'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => QuizAppState();
}

class QuizAppState extends State<HomePage> {
  String ratedColorStr = '';
  Color ratedColorBgColor = Colors.white;
  Color ratedColorFgColor = Colors.black;

  void updateRatedColor(String color) {
    setState(() {
      ratedColorStr = "Your favorite color is $color";
      if (color == "Black") {
        ratedColorBgColor = Colors.black;
        ratedColorFgColor = Colors.white;
      }
      else if (color == "White") {
        ratedColorBgColor = Colors.white;
        ratedColorFgColor = Colors.black;
      }
      else if (color == "Green") {
        ratedColorBgColor = Colors.green;
        ratedColorFgColor = Colors.black;
      }
      else if (color == "Blue") {
        ratedColorBgColor = Colors.blue;
        ratedColorFgColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text('Quiz App'),
          backgroundColor: Colors.lightBlue,
          centerTitle: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5)),
            const Text(
              'What is your favorite color?',
              style: TextStyle(fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5)),
            Row(children: [
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  updateRatedColor('Black');
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                  foregroundColor:
                      WidgetStatePropertyAll<Color>(Colors.white54),
                ),
                child: const Text('Black'),
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                  onPressed: () {
                    updateRatedColor('White');
                  },
                  child: const Text('White')),
              const Spacer(flex: 1),
              ElevatedButton(
                  onPressed: () {
                    updateRatedColor('Green');
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(Colors.green),
                  ),
                  child: const Text('Green')),
              const Spacer(flex: 1),
              ElevatedButton(
                  onPressed: () {
                    updateRatedColor('Blue');
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.blue)
                  ),
                  child: const Text('Blue')),
              const Spacer(flex: 1),
            ]),
            const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5)),
            Text(
              ratedColorStr,
              style:
                TextStyle(
                    fontSize: 20,
                    backgroundColor: ratedColorBgColor,
                    color: ratedColorFgColor
                )
            )
          ],
        ),
      ),
    );
  }
}
