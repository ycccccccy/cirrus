import 'package:flutter/material.dart';

/// 一个可定制的卡片组件，具有现代化、简洁的设计风格。
/// 其灵感来源于 EAuxiliary 应用，拥有圆角和柔和的阴影。
class CirrusCard extends StatefulWidget {
  /// 卡片中容纳的子组件。
  final Widget child;

  /// 子组件的内边距。
  final EdgeInsetsGeometry? padding;

  /// 卡片的背景颜色。
  final Color? color;

  /// 当卡片被点击时调用的回调函数。
  final VoidCallback? onTap;

  /// 创建一个具有现代化设计风格的卡片。
  const CirrusCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.onTap,
  });

  @override
  State<CirrusCard> createState() => _CirrusCardState();
}

class _CirrusCardState extends State<CirrusCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final cardTheme = Theme.of(context).cardTheme;
    final borderRadius = cardTheme.shape is RoundedRectangleBorder
        ? (cardTheme.shape as RoundedRectangleBorder).borderRadius
        : BorderRadius.zero;

    final double elevation = _isPressed ? 30.0 : 20.0;
    final double scale = _isPressed ? 1.02 : 1.0;

    return Listener(
      onPointerDown: widget.onTap == null ? null : (_) => setState(() => _isPressed = true),
      onPointerUp: widget.onTap == null ? null : (_) => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(scale),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.color ?? cardTheme.color,
          borderRadius: borderRadius,
          boxShadow: cardTheme.shadowColor != null
              ? [
                  BoxShadow(
                    color: cardTheme.shadowColor!,
                    blurRadius: elevation,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: borderRadius.resolve(Directionality.of(context)),
            onTap: widget.onTap,
            child: Padding(
              padding: widget.padding ?? cardTheme.margin ?? const EdgeInsets.all(16.0),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
