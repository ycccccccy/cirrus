import 'package:flutter/material.dart';

/// Cirrus 设计系统中的抽屉导航。
///
/// 包含优雅的滑入滑出动画和背景遮罩效果。
import 'package:cirrus/src/widgets/animated_list_fade_in.dart';

class CirrusDrawer extends StatelessWidget {
  /// 抽屉中要显示的子组件列表。
  final List<Widget> children;
  final Color? backgroundColor;
  final double? elevation;
  final double? width;

  const CirrusDrawer({
    super.key,
    required this.children,
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
      child: AnimatedListFadeIn(
        children: children,
      ),
    );
  }
}
