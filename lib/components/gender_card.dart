import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.color,
      required this.content,
      required this.isSelected,
      required this.onPress});

  final Color color;
  final Widget content;
  final bool isSelected;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: isSelected
              ? Border.all(
                  width: 1.0,
                  color: const Color(0xFF06C46B),
                  style: BorderStyle.solid,
                )
              : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: isSelected
                        ? const Color(0xFF06C46B)
                        : Colors.white, // Colors.white // Color(0xFF06C46B)
                  )
                ],
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
