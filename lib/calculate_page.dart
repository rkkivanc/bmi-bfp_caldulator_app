import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key, required this.bmi, required this.bfp});

  final double bmi, bfp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation Results'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          _introductionText(),
          _bmiResultContainer(),
          _bfpResultContainer(),
        ],
      ),
    );
  }

  Container _introductionText() {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'Here are your BMI and BFP results!',
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  Container _bmiResultContainer() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your BMI', style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 10),
          Text(
            bmi.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 36,
              color: bmi < 18.5
                  ? Colors.yellow
                  : bmi >= 18.5 && bmi < 24.9
                  ? Colors.green
                  : bmi >= 25 && bmi < 29.9
                  ? Colors.orange
                  : Colors.red,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'You are ${bmi < 18.5
                ? 'Underweight'
                : bmi >= 18.5 && bmi < 24.9
                ? 'Normal weight'
                : bmi >= 25 && bmi < 29.9
                ? 'Overweight'
                : 'Obese'}',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Container _bfpResultContainer() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your BFP', style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 10),
          Text(
            '${bfp.toStringAsFixed(2)}%',
            style: TextStyle(
              fontSize: 36,
              color: bfp < 6
                  ? Colors.yellow
                  : bfp >= 6 && bfp <= 20
                  ? Colors.green
                  : bfp > 20 && bfp < 30
                  ? Colors.orange
                  : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
