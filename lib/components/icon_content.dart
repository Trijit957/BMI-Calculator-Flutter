import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected});

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: isSelected ? const Color(0xFF06C46B) : Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 18.0,
                color: isSelected ? const Color(0xFF06C46B) : Colors.white),
          ),
        )
      ],
    );
  }
}
