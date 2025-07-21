import 'package:flutter/material.dart';

/// Cirrus 设计系统中的图标按钮。
///
/// 包含优雅的波纹动画和按压反馈效果。
class CirrusIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String? tooltip;
  final double? iconSize;

  const CirrusIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: tooltip,
      iconSize: iconSize,
      // 样式会从 ThemeData.iconButtonTheme 中获取
      // 包含了内置的波纹动画和按压反馈
    );
  }
}
