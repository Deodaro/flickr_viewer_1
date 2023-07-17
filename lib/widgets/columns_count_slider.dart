import 'package:flutter/material.dart';

class ColumnsCountSlider extends StatefulWidget {
  const ColumnsCountSlider({super.key});

  @override
  State<ColumnsCountSlider> createState() => _ColumnsCountSliderState();
}

class _ColumnsCountSliderState extends State<ColumnsCountSlider> {
  double _currentSliderValue = 2;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 1,
      max: 3,
      divisions: 3,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
