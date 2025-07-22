import 'package:flutter/material.dart';

/// 显示一个 Cirrus 风格的模态底部动作条。
///
/// `showCirrusBottomSheet` 函数是 `showModalBottomSheet` 的一个封装，
/// 提供了与 Cirrus 设计体系一致的外观和感觉。
/// 它具有拖动手柄和圆角。
import 'package:cirrus/src/widgets/animated_list_fade_in.dart';

Future<T?> showCirrusBottomSheet<T>({
  required BuildContext context,
  required List<Widget> children,
  Color? backgroundColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    backgroundColor: Colors.transparent, // Use our own container for styling
    elevation: 0,
    builder: (context) {
      return CirrusBottomSheet(
        backgroundColor: backgroundColor,
        children: children,
      );
    },
  );
}

/// 一个为 Cirrus 底部动作条提供标准布局的容器组件。
///
/// 这个组件包含一个拖动手柄以及适当的内边距和装饰。
/// 它通常在 `showModalBottomSheet` 调用中使用，并由 `showCirrusBottomSheet` 辅助函数进行封装。
class CirrusBottomSheet extends StatelessWidget {
  /// 在底部动作条内部显示的内容。
  final List<Widget> children;

  /// 底部动作条的背景颜色。
  final Color? backgroundColor;

  /// 创建一个 Cirrus 底部动作条容器。
  const CirrusBottomSheet({
    super.key,
    required this.children,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sheetTheme = theme.bottomSheetTheme;
    final effectiveBackgroundColor = backgroundColor ?? sheetTheme.modalBackgroundColor ?? sheetTheme.backgroundColor ?? theme.scaffoldBackgroundColor;

    return Container(
      padding: const EdgeInsets.only(top: 12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            effectiveBackgroundColor,
            Color.lerp(effectiveBackgroundColor, Colors.black, 0.05)!,
          ],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.15),
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(height: 12),
          // Content
          Flexible(
            child: AnimatedListFadeIn(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
