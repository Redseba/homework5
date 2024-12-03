import 'package:flutter/material.dart';

class SetupScreen extends StatefulWidget {
  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  // Category options and their corresponding IDs
  final Map<String, String> _categories = {
    'General Knowledge': '9',
    'Entertainment: Film': '11',
    'Sports': '21',
    'Music': '12',
    'Geography': '22',
    // Add more categories as needed
  };

  String _selectedCategory = '9';
  int _numQuestions = 10;
  String _difficulty = 'easy';
  String _type = 'multiple';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Milky grey background for the screen
      appBar: AppBar(
        title: Text('Quiz Setup', textAlign: TextAlign.center), // Centered title
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
            ),
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title Text
                Text(
                  'Select Quiz Options',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Select number of questions
                Text(
                  'Select Number of Questions',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue), // Border for dropdown
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<int>(
                    value: _numQuestions,
                    onChanged: (int? newValue) {
                      setState(() {
                        _numQuestions = newValue!;
                      });
                    },
                    isExpanded: true,
                    items: [5, 10, 15].map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(value.toString()),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),

                // Select category
                Text(
                  'Select Category',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue), // Border for dropdown
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                    isExpanded: true,
                    items: _categories.keys.map<DropdownMenuItem<String>>((String category) {
                      return DropdownMenuItem<String>(
                        value: _categories[category]!,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(category),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),

                // Select difficulty
                Text(
                  'Select Difficulty',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue), // Border for dropdown
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _difficulty,
                    onChanged: (String? newValue) {
                      setState(() {
                        _difficulty = newValue!;
                      });
                    },
                    isExpanded: true,
                    items: ['easy', 'medium', 'hard']
                        .map<DropdownMenuItem<String>>((String difficulty) {
                      return DropdownMenuItem<String>(
                        value: difficulty,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(difficulty[0].toUpperCase() + difficulty.substring(1)), // Capitalize first letter
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),

                // Select question type
                Text(
                  'Select Question Type',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue), // Border for dropdown
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _type,
                    onChanged: (String? newValue) {
                      setState(() {
                        _type = newValue!;
                      });
                    },
                    isExpanded: true,
                    items: ['multiple', 'boolean']
                        .map<DropdownMenuItem<String>>((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(type == 'multiple' ? 'Multiple Choice' : 'True/False'),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),

                // Start Quiz Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/quiz',
                      arguments: {
                        'numQuestions': _numQuestions,
                        'category': _selectedCategory,
                        'difficulty': _difficulty,
                        'type': _type,
                      },
                    );
                  },
                  child: Text('Start Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
