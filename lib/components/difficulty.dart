import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(Icons.star,
              size: 17,
              color: rating > i
                  ? Colors.red
                  : Colors.black),
      ],
    );
  }
}
