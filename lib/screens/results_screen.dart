import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const Map<String, String> BmiResult = {
  'UW': 'underweight',
  'N': 'normal',
  'OW': 'overweight',
  'O': 'obesity'
};

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  Color _setColor() {
    Color color;
    if (bmiResult == BmiResult['UW']) {
      color = Colors.yellow;
    } else if (bmiResult == BmiResult['N']) {
      color = const Color(0xFF06C46B);
    } else if (bmiResult == BmiResult['OW']) {
      color = Colors.red[400]!;
    } else if (bmiResult == BmiResult['O']) {
      color = Colors.red;
    } else {
      color = Colors.white;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Result',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),

            /** Center Card */
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            bmiResult.toUpperCase(),
                            style: TextStyle(
                              color: _setColor(),
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          resultText,
                          style: const TextStyle(
                            fontSize: 80.0,
                          ),
                        ),
                      ),
                      const Text(
                        'Normal BMI Range:',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const Text('18.5 - 25'),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              interpretation,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            BottomButton(
              label: 'Re-Calculate BMI',
              onPress: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 25.0,
            )
          ],
        ),
      ),
    );
  }
}
