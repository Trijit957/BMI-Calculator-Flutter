import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String value;
  final void Function() onIncrease;
  final void Function() onDecrease;

  const CounterCard({
    super.key,
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: onDecrease,
            child: const Icon(
              Icons.remove_circle,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.black),
          ),
          GestureDetector(
            onTap: onIncrease,
            child: const Icon(
              Icons.add_circle,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
