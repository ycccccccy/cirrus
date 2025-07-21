import 'package:flutter/material.dart';

/// Cirrus 设计系统中的工具提示。
///
/// 这是一个对 Flutter 原生 [Tooltip] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
class CirrusTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const CirrusTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
      // Tooltip 的样式会从 ThemeData.tooltipTheme 中获取
    );
  }
}
