import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  BmiResultScreen({required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    int bmi = (weight / ((height / 100) * (height / 100))).round().toInt();
    String condition;
    if (bmi >= 18.5 && bmi <= 25) {
      condition = "Normal";
    } else if (bmi >= 25 && bmi <= 30) {
      condition = "Overweight";
    } else if (bmi >= 30) {
      condition = "Obesity";
    } else {
      condition = "Underweight";
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BMI Result",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "BMI: $bmi",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Condition: $condition",
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
