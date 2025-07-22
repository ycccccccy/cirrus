import 'package:flutter/material.dart';

/// Cirrus 设计系统中的应用标题栏。
///
/// 这是一个对 Flutter 原生 [AppBar] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
class CirrusAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;

  const CirrusAppBar({super.key, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    // AppBar 会自动从 context 的 ThemeData.appBarTheme 中获取样式
    return AppBar(title: title, actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
