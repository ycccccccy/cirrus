import 'package:flutter/material.dart';

/// 一个风格化的列表项组件，其设计与 EAuxiliary 应用的设置页面保持一致。
///
/// 它为标题、副标题和尾部组件提供了一个简洁的布局。
class CirrusListTile extends StatelessWidget {
  /// 列表项的主要内容，通常是一个 [Text] 组件。
  final Widget title;

  /// 显示在标题下方的附加内容，通常是一个 [Text] 组件。
  final Widget? subtitle;

  /// 显示在标题后方的组件，通常是一个 [Icon] 或 [Switch]。
  final Widget? trailing;

  /// 当用户点击此列表项时触发的回调函数。
  final VoidCallback? onTap;

  /// 创建一个具有现代化设计风格的列表项。
  const CirrusListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final listTileTheme = theme.listTileTheme;

    return ListTile(
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      contentPadding: listTileTheme.contentPadding,
      shape: listTileTheme.shape,
    );
  }
}
