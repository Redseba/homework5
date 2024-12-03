import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final int score;
  final int total;

  const SummaryScreen({
    Key? key,
    required this.score,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Summary')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score/$total',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Retake Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}