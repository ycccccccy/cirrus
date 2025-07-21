import 'package:flutter/material.dart';

/// Cirrus 设计系统中的浮动操作按钮。
///
/// 包含优雅的波纹动画、悬浮阴影效果和按压反馈。
class CirrusFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final String? tooltip;
  final bool mini;

  const CirrusFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.mini = false,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      mini: mini,
      child: child,
      // 样式会从 ThemeData.floatingActionButtonTheme 中获取
      // 包含了内置的波纹动画和悬浮效果
    );
  }
}
