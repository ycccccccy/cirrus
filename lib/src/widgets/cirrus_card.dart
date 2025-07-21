import 'package:flutter/material.dart';

/// 一个可定制的卡片组件，具有现代化、简洁的设计风格。
/// 其灵感来源于 EAuxiliary 应用，拥有圆角和柔和的阴影。
class CirrusCard extends StatelessWidget {
  /// 卡片中容纳的子组件。
  final Widget child;

  /// 子组件的内边距。
  final EdgeInsetsGeometry? padding;

  /// 卡片的背景颜色。
  final Color? color;

  /// 创建一个具有现代化设计风格的卡片。
  const CirrusCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cardTheme = Theme.of(context).cardTheme;

    return Container(
      decoration: BoxDecoration(
        color: color ?? cardTheme.color,
        borderRadius: cardTheme.shape is RoundedRectangleBorder
            ? (cardTheme.shape as RoundedRectangleBorder).borderRadius
            : BorderRadius.zero,
        boxShadow: cardTheme.shadowColor != null
            ? [
                BoxShadow(
                  color: cardTheme.shadowColor!,
                  blurRadius: 20, // 可考虑加入主题
                  offset: const Offset(0, 4), // 可考虑加入主题
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: padding ?? cardTheme.margin ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
