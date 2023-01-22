import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/counter_card.dart';

enum GenderEnum { male, female }

enum WeightUnitEnum { kg, lb }

enum HeightUnitEnum { ft, cm }

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _weightUnits = <String>['kg', 'lb'];
  final List<String> _heightUnits = <String>['ft', 'cm'];

  late GenderEnum selectedGender = GenderEnum.male;
  late String _selectedWeightUnit = _weightUnits.first;
  late String _selectedHeightUnit = _heightUnits.first;
  late int _selectedWeight = 80;
  late double _selectedHeight = 5.8;
  late int _selectedAge = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Calculate your BMI',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ),
            ),

            /* Gender Heading */
            Row(
              children: const <Widget>[
                Text('Gender'),
              ],
            ),

            /* Gender Cards */
            Row(
              children: <Widget>[
                Expanded(
                  child: GenderCard(
                    color: Colors.black26,
                    content: IconContent(
                      icon: Icons.man,
                      label: 'Male',
                      isSelected: selectedGender == GenderEnum.male,
                    ),
                    isSelected: selectedGender == GenderEnum.male,
                    onPress: () {
                      setState(() {
                        selectedGender = GenderEnum.male;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: GenderCard(
                    color: Colors.black26,
                    content: IconContent(
                      icon: Icons.woman,
                      label: 'Female',
                      isSelected: selectedGender == GenderEnum.female,
                    ),
                    isSelected: selectedGender == GenderEnum.female,
                    onPress: () {
                      setState(() {
                        selectedGender = GenderEnum.female;
                      });
                    },
                  ),
                )
              ],
            ),

            /* Weight Heading */
            Row(
              children: const <Widget>[
                Text('Weight'),
              ],
            ),

            /* Select Weight Section */
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: CounterCard(
                      value: _selectedWeight.toString(),
                      onIncrease: () {
                        setState(() {
                          _selectedWeight++;
                        });
                      },
                      onDecrease: () {
                        setState(() {
                          _selectedWeight--;
                        });
                      }),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedWeightUnit,
                    items: _weightUnits
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        _selectedWeightUnit = value!;
                        if (_selectedWeightUnit ==
                            WeightUnitEnum.lb.toString().split('.').last) {
                          _selectedWeight = (_selectedWeight * 2.2).toInt();
                        } else if (_selectedWeightUnit ==
                            WeightUnitEnum.kg.toString().split('.').last) {
                          _selectedWeight = _selectedWeight ~/ 2.2;
                        }
                      });
                    },
                  ),
                )
              ],
            ),

            /* Height Heading */
            Row(
              children: const <Widget>[
                Text('Height'),
              ],
            ),

            /* Select Height Section */
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: CounterCard(
                    value: _selectedHeight.toString(),
                    onIncrease: () {
                      setState(() {
                        _selectedHeight += 0.1;
                        _selectedHeight =
                            double.parse(_selectedHeight.toStringAsFixed(1));
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        _selectedHeight -= 0.1;
                        _selectedHeight =
                            double.parse(_selectedHeight.toStringAsFixed(1));
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedHeightUnit,
                    items: _heightUnits
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedHeightUnit = value!;
                        if (_selectedHeightUnit ==
                            HeightUnitEnum.cm.toString().split('.').last) {
                          _selectedHeight = double.parse(
                              (_selectedHeight * 30.48).toStringAsFixed(1));
                        } else if (_selectedHeightUnit ==
                            HeightUnitEnum.ft.toString().split('.').last) {
                          _selectedHeight = double.parse(
                              (_selectedHeight / 30.48).toStringAsFixed(1));
                        }
                      });
                    },
                  ),
                ),
              ],
            ),

            /* Age Heading */
            Row(
              children: const <Widget>[
                Text('Age'),
              ],
            ),

            /* Select Age Section */
            Row(
              children: <Widget>[
                Expanded(
                    child: CounterCard(
                  value: _selectedAge.toString(),
                  onIncrease: () {
                    setState(() {
                      _selectedAge++;
                    });
                  },
                  onDecrease: () {
                    setState(() {
                      _selectedAge--;
                    });
                  },
                )),
              ],
            ),

            /* Gap */
            const SizedBox(
              height: 10.0,
            ),

            /* Calculate Button */
            Row(
              children: <Widget>[
                Expanded(
                  child: BottomButton(
                      label: 'Calculate',
                      onPress: () {
                        double finalHeight = 0.0;
                        double finalWeight = 0.0;

                        if (_selectedHeightUnit ==
                            HeightUnitEnum.cm.toString().split('.').last) {
                          finalHeight = _selectedHeight;
                        } else if (_selectedHeightUnit ==
                            HeightUnitEnum.ft.toString().split('.').last) {
                          finalHeight = _selectedHeight * 30.48;
                        }

                        if (_selectedWeightUnit ==
                            WeightUnitEnum.kg.toString().split('.').last) {
                          finalWeight = _selectedWeight.toDouble();
                        } else if (_selectedWeightUnit ==
                            WeightUnitEnum.lb.toString().split('.').last) {
                          finalWeight = _selectedWeight / 2.2;
                        }

                        CalculatorBrain calcBrain = CalculatorBrain(
                          height: finalHeight,
                          weight: finalWeight,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsScreen(
                              resultText: calcBrain.calculateBMI(),
                              bmiResult: calcBrain.getResult(),
                              interpretation: calcBrain.getInterpretation(),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
