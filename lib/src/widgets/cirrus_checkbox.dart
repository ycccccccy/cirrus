import 'package:flutter/material.dart';

/// Cirrus 设计系统中的复选框。
///
/// 包含优雅的勾选动画和状态变化过渡效果。
class CirrusCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? title;

  const CirrusCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return CheckboxListTile(
        title: Text(title!),
        value: value,
        onChanged: onChanged,
        // 样式会从 ThemeData.checkboxTheme 中获取
        // 包含了内置的勾选动画效果
      );
    }

    return Checkbox(
      value: value,
      onChanged: onChanged,
      // 样式会从 ThemeData.checkboxTheme 中获取
      // 包含了内置的勾选动画效果
    );
  }
}
