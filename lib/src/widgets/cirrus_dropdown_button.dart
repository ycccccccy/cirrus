import 'package:flutter/material.dart';

/// Cirrus 设计系统中的下拉选择按钮。
///
/// 包含优雅的展开/收缩动画和选项选择反馈效果。
class CirrusDropdownButton<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? hint;

  const CirrusDropdownButton({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      hint: hint != null ? Text(hint!) : null,
      // 样式会从 ThemeData.dropdownMenuTheme 中获取
      // 包含了内置的展开/收缩动画效果
    );
  }
}
