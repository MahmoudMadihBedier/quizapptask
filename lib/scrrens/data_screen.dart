import 'package:flutter/material.dart';

import '../matirel/quiz_widget.dart';

class qUIZ_DATA extends StatefulWidget {
  final String data;

  const qUIZ_DATA({Key? key, required this.data}) : super(key: key);

  @override
  State<qUIZ_DATA> createState() => _qUIZ_DATAState();
}

class _qUIZ_DATAState extends State<qUIZ_DATA> {
  String _dropDownValue = 'flutter';
  var _items = ['flutter', 'c++', 'python'];

  // Quiz data
  List<Map<String, dynamic>> _quizData = [
    {
      'question': 'What is Flutter?',
      'options': ['A framework', 'A language', 'A bird'],
      'correctIndex': 0,
    },
    {
      'question': 'Who developed Flutter?',
      'options': ['Google', 'Facebook', 'Microsoft'],
      'correctIndex': 0,
    },
    {
      'question': 'What language is Flutter built with?',
      'options': ['Java', 'Dart', 'Swift'],
      'correctIndex': 1,
    },
  ];

  int _score = 0;
  bool _quizCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            alignment: Alignment.topRight,
            height: 250,
            width: 200,
            child: Image.asset('assets/AnimatiedQuiz.png'),
          ),
          SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('let\'s go',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text("hi...",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  widget.data, // Display the received data here
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text("please select your major to test on it ..",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  width: 200,
                  height: 100,
                  child: SizedBox(
                      width: 25,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.green, Colors.lightBlueAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Center(
                          child: DropdownButton(
                            items: _items.map((String item) {
                              return DropdownMenuItem(
                                  value: item, child: Text(item));
                            }).toList(),
                            onChanged: (String? newvalue) {
                              setState(() {
                                _dropDownValue = newvalue!;
                              });
                            },
                            value: _dropDownValue,
                            borderRadius: BorderRadius.circular(30),
                            icon:
                            const Icon(Icons.keyboard_arrow_down_outlined),
                            iconSize: 50,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(18),
              child: SizedBox(
                width: 25,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.green, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _quizCompleted
                          ? null
                          : () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: 700,
                                // Child that contains the quiz
                                child: QuizWidget(
                                  quizData: _quizData,
                                  onQuizCompleted: _onQuizCompleted,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        _quizCompleted ? 'Quiz Completed' : 'Let\'s go ',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_quizCompleted)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Congratulations!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'You scored $_score out of ${_quizData.length}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _onQuizCompleted(List<int> selectedAnswers) {
    int correctAnswers = 0;
    for (int i = 0; i < _quizData.length; i++) {
      if (selectedAnswers[i] == _quizData[i]['correctIndex']) {
        correctAnswers++;
      }
    }
    setState(() {
      _score = correctAnswers;
      _quizCompleted = true;
    });
  }
}
