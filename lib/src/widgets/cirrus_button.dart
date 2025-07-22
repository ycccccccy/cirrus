import 'package:flutter/material.dart';

/// 一个遵循 EAuxiliary 应用设计语言的可定制按钮组件。
/// 它具有纯色背景、圆角以及柔和的按压效果。
class CirrusButton extends StatefulWidget {
  /// 当按钮被点击时触发的回调函数。
  final VoidCallback? onPressed;

  /// 按钮中容纳的子组件，通常是一个 [Text] 组件。
  final Widget child;

  /// 按钮的背景颜色。
  final Color? backgroundColor;

  /// 创建一个具有现代化设计风格的按钮。
  const CirrusButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
  });

  @override
  State<CirrusButton> createState() => _CirrusButtonState();
}

class _CirrusButtonState extends State<CirrusButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = theme.elevatedButtonTheme.style;

    // 从主题中解析样式，如果未定义则提供回退值
    final effectiveBackgroundColor = widget.backgroundColor ?? buttonStyle?.backgroundColor?.resolve({}) ?? theme.colorScheme.primary;
    final borderRadius = (buttonStyle?.shape?.resolve({}) as RoundedRectangleBorder?)?.borderRadius ?? BorderRadius.circular(24);
    final padding = buttonStyle?.padding?.resolve({}) ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8);

    final scale = _isPressed ? 0.95 : (_isHovered ? 1.03 : 1.0);
    final elevation = _isHovered ? 12.0 : 6.0;

    return Listener(
      onPointerDown: widget.onPressed == null ? null : (_) => setState(() => _isPressed = true),
      onPointerUp: widget.onPressed == null ? null : (_) => setState(() => _isPressed = false),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: Material(
            elevation: elevation,
            color: effectiveBackgroundColor,
            shadowColor: Colors.black.withOpacity(0.3),
            borderRadius: borderRadius.resolve(Directionality.of(context)),
            child: InkWell(
              borderRadius: borderRadius.resolve(Directionality.of(context)),
              onTap: widget.onPressed,
              child: Padding(
                padding: padding,
                child: DefaultTextStyle(
                  style: theme.textTheme.labelLarge!.copyWith(color: effectiveBackgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
