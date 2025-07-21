import 'package:flutter/material.dart';

/// Cirrus 设计系统中的底部导航栏。
///
/// 切换项目时，标签和图标会有平滑的淡入淡出和大小变化动画。
class CirrusBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final List<BottomNavigationBarItem> items;

  const CirrusBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    // BottomNavigationBar 默认包含了优美的动画效果。
    // 样式会从 ThemeData.bottomNavigationBarTheme 中获取。
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      // TODO: 在 CirrusTheme 中定义 BottomNavigationBarThemeData 以统一风格。
    );
  }
}
