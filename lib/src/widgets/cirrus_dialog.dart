import 'package:flutter/material.dart';

/// Cirrus 设计系统中的对话框。
///
/// 这是一个对 Flutter 原生 [AlertDialog] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
class CirrusDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  const CirrusDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    // AlertDialog 会自动从 context 的 ThemeData.dialogTheme 中获取样式
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
      actionsPadding: const EdgeInsets.all(16.0),
    );
  }
}
