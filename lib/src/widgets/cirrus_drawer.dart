import 'package:flutter/material.dart';

/// Cirrus 设计系统中的抽屉导航。
///
/// 包含优雅的滑入滑出动画和背景遮罩效果。
class CirrusDrawer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? elevation;
  final double? width;

  const CirrusDrawer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.elevation,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      elevation: elevation,
      width: width,
      child: child,
      // 包含了内置的滑入滑出动画效果
    );
  }
}
