import 'package:flutter/material.dart';

/// 一个遵循 EAuxiliary 应用设计语言的可定制按钮组件。
/// 它具有纯色背景、圆角以及柔和的按压效果。
class CirrusButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = theme.elevatedButtonTheme.style?.copyWith(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (backgroundColor != null) {
            return backgroundColor;
          }
          return theme.elevatedButtonTheme.style?.backgroundColor?.resolve(states);
        },
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: child,
    );
  }
}
