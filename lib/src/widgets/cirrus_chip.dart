import 'package:flutter/material.dart';

/// Cirrus 设计系统中的标签（Chip）。
///
/// 这是一个对 Flutter 原生 [Chip] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
class CirrusChip extends StatelessWidget {
  final Widget label;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;

  const CirrusChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final chipTheme = Theme.of(context).chipTheme;

    return ChoiceChip(
      label: label,
      selected: isSelected,
      onSelected: onSelected,
      checkmarkColor: chipTheme.checkmarkColor,
      // 其他样式会自动从 chipTheme 中获取
    );
  }
}
