import 'package:flutter/material.dart';

/// Cirrus 设计系统中的单选按钮。
///
/// 包含优雅的选中动画和状态变化过渡效果。
class CirrusRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? title;

  const CirrusRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return RadioListTile<T>(
        title: Text(title!),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        // 样式会从 ThemeData.radioTheme 中获取
        // 包含了内置的选中动画效果
      );
    }
    
    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      // 样式会从 ThemeData.radioTheme 中获取
      // 包含了内置的选中动画效果
    );
  }
}
