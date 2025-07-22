import 'package:flutter/material.dart';

/// Cirrus 设计系统中的可展开列表项。
///
/// 包含优雅的展开/折叠动画，以及旋转的箭头指示器。
/// 支持自定义前缀内容，如序号、图标或留空。
class CirrusExpansionTile extends StatelessWidget {
  final Widget title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final Widget? leading;
  final bool showTrailing;

  const CirrusExpansionTile({
    super.key,
    required this.title,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
    this.leading,
    this.showTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    // ExpansionTile 默认包含了优美的动画效果。
    // 样式会从 ThemeData.expansionTileTheme 中获取。
    return ExpansionTile(
      title: title,
      initiallyExpanded: initiallyExpanded,
      leading: leading,
      trailing: showTrailing ? null : const SizedBox.shrink(),
      children: children,
    );
  }
}
