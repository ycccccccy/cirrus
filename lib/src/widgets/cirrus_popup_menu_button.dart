import 'package:flutter/material.dart';

/// Cirrus 设计系统中的弹出菜单按钮。
///
/// 菜单的弹出和消失会伴随着平滑的动画效果。
class CirrusPopupMenuButton<T> extends StatelessWidget {
  final List<PopupMenuEntry<T>> Function(BuildContext) itemBuilder;
  final void Function(T)? onSelected;
  final Widget? child;

  const CirrusPopupMenuButton({
    super.key,
    required this.itemBuilder,
    this.onSelected,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    // PopupMenuButton 默认包含了优雅的动画效果。
    // 样式会从 ThemeData.popupMenuTheme 中获取。
    return PopupMenuButton<T>(
      itemBuilder: itemBuilder,
      onSelected: onSelected,
      child: child,
      // TODO: 在 CirrusTheme 中定义 PopupMenuThemeData 以统一风格。
    );
  }
}
