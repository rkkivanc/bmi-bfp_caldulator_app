import 'package:bmi_calculator/calculate_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentSliderValue = 180;
  int _currentWeight = 70;
  int _currentAge = 25;
  int _selectedGenderIndex = 0; // 0 for male, 1 for female
  double _bmi = 0;
  double _bfp = 0;

  void _calculateBmi() {
    _bmi =
        _currentWeight /
        ((_currentSliderValue / 100) * (_currentSliderValue / 100));
  }

  void _calculateBfp() {
    if (_selectedGenderIndex == 0) {
      _bfp = (1.20 * _bmi) + (0.23 * _currentAge) - (10.8 * 1) - 5.4;
    } else {
      _bfp = (1.20 * _bmi) + (0.23 * _currentAge) - (10.8 * 0) - 5.4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI-BFP Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        leading: SizedBox(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      _selectedGenderIndex = 0;
                      setState(() {});
                    },
                    child: _maleContainer(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      _selectedGenderIndex = 1;
                      setState(() {});
                    },
                    child: _femaleContainer(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: _heightContainer()),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(flex: 2, child: _weightContainer()),
                Expanded(flex: 2, child: _ageContainer()),
              ],
            ),
          ),
          Expanded(flex: 1, child: _calculateButton()),
        ],
      ),
    );
  }

  Container _maleContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _selectedGenderIndex == 0
            ? Colors.grey.shade900
            : Colors.grey.shade800,
      ),
      margin: const EdgeInsets.all(15),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.male, size: 50, color: Colors.white),
            Text('Male', style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Container _femaleContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _selectedGenderIndex == 1
            ? Colors.grey.shade900
            : Colors.grey.shade800,
      ),
      margin: const EdgeInsets.all(15),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.female, size: 50, color: Colors.white),
            Text('Female', style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Container _heightContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
      ),
      margin: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Height',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              '${_currentSliderValue.round()} cm',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),

            Slider(
              value: _currentSliderValue,
              min: 30,
              max: 250,
              divisions: 220,
              label: _currentSliderValue.round().toString(),
              onChanged: (double newValue) {
                setState(() {
                  _currentSliderValue = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _weightContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
      ),
      margin: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Weight', style: TextStyle(fontSize: 20, color: Colors.white)),
            Text(
              '$_currentWeight kg',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade900,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _currentWeight--;
                      });
                    },
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade900,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _currentWeight++;
                      });
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _ageContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
      ),
      margin: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Age', style: TextStyle(fontSize: 20, color: Colors.white)),
            Text(
              '$_currentAge',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade900,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _currentAge--;
                      });
                    },
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade900,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _currentAge++;
                      });
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _calculateButton() {
    return GestureDetector(
      onTap: () {
        _calculateBmi();
        _calculateBfp();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CalculatePage(bmi: _bmi, bfp: _bfp),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: const Center(
          child: Text(
            'Calculate BMI-BFP',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
