import 'package:flutter/material.dart';

/// Cirrus 设计系统中的滑块。
///
/// 这是一个对 Flutter 原生 [Slider] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
class CirrusSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;

  const CirrusSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      // Slider 的样式会从 ThemeData.sliderTheme 中获取
    );
  }
}
