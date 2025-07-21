import 'package:flutter/material.dart';

/// Cirrus 设计系统中的轻量级提示（SnackBar）。
///
/// 这是一个辅助类，用于显示遵循 [CirrusTheme] 设计规范的 [SnackBar]。
class CirrusSnackBar {
  static void show(BuildContext context, {required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        // SnackBar 的样式会从 ThemeData.snackBarTheme 中获取
      ),
    );
  }
}
