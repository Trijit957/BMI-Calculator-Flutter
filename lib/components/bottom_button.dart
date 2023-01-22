import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.label, required this.onPress});

  final String label;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      height: 50.0,
      color: const Color(0xFF06C46B),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
