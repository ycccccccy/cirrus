import 'package:flutter/material.dart';

/// Cirrus 设计系统中的标签页栏。
///
/// 这是一个对 Flutter 原生 [TabBar] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
class CirrusTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  const CirrusTabBar({super.key, required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: tabs,
      // TabBar 的样式会从 ThemeData.tabBarTheme 中获取
    );
  }
}
