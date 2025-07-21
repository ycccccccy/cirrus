import 'package:flutter/material.dart';

/// Cirrus 设计系统中的搜索栏。
///
/// 包含优雅的展开/收缩动画和输入反馈效果。
class CirrusSearchBar extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final TextEditingController? controller;

  const CirrusSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText ?? '搜索...',
      onChanged: onChanged,
      controller: controller,
      // 样式会从 ThemeData.searchBarTheme 中获取
      // 包含了内置的展开/收缩动画效果
    );
  }
}
