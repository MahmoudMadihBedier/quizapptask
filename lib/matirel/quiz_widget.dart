import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_confetti/flutter_confetti.dart';

class QuizWidget extends StatefulWidget {
  final List<Map<String, dynamic>> quizData;
  final Function(List<int>) onQuizCompleted;

  const QuizWidget({Key? key, required this.quizData, required this.onQuizCompleted})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int _currentIndex = 0;
  List<int> _selectedAnswers = [-1, -1, -1];
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            widget.quizData[_currentIndex]['question'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Column(
            children: List.generate(
              widget.quizData[_currentIndex]['options'].length,
                  (index) => Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == _selectedAnswers[_currentIndex]
                      ? const Color(0xFF303181)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: RadioListTile<int>(
                  value: index,
                  groupValue: _selectedAnswers[_currentIndex],
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswers[_currentIndex] = value!;
                    });
                  },
                  title: Text(
                    widget.quizData[_currentIndex]['options'][index],
                    style: TextStyle(
                      color: index == _selectedAnswers[_currentIndex]
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_currentIndex < widget.quizData.length - 1) {
                setState(() {
                  _currentIndex++;
                });
              } else {
                _confettiController.play(); // Start confetti animation
                Future.delayed(Duration(seconds: 3), () {
                  _confettiController.stop(); // Stop confetti after 3 seconds
                  widget.onQuizCompleted(_selectedAnswers);
                  Navigator.of(context).pop(); // Close the bottom sheet
                });
              }
            },
            child: Text(
              _currentIndex < widget.quizData.length - 1 ? 'Next' : 'Submit',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            numberOfParticles: 20,
            gravity: 0.1,
            particleDrag: 0.05,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple,
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose(); // Dispose confetti controller
    super.dispose();
  }
}
