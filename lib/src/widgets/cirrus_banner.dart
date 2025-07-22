import 'package:flutter/material.dart';

/// 一个横幅组件，用于显示一条重要的简洁信息，并为用户提供可操作的选项。
/// 它通常显示在屏幕的顶部，位于应用导航栏下方。
///
/// [CirrusBanner] 是一个遵循 Cirrus 设计风格的自定义实现，
/// 在保持横幅核心功能的同时，提供了独特的外观和感觉。
class CirrusBanner extends StatefulWidget {
  /// 横幅的主要内容。
  final Widget content;

  /// 显示在横幅底部的操作按钮列表。
  final List<Widget> actions;

  /// 显示在横幅起始位置的图标。
  final Widget? leading;

  /// 横幅的背景颜色。
  final Color? backgroundColor;

  /// 内容和前置图标的颜色。
  final Color? contentColor;

  /// 创建一个 Cirrus 横幅组件。
  const CirrusBanner({
    super.key,
    required this.content,
    required this.actions,
    this.leading,
    this.backgroundColor,
    this.contentColor,
  });

  @override
  State<CirrusBanner> createState() => _CirrusBannerState();
}

class _CirrusBannerState extends State<CirrusBanner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bannerTheme = theme.bannerTheme;

    final Color effectiveBackgroundColor = widget.backgroundColor ?? bannerTheme.backgroundColor ?? theme.colorScheme.surface;
    final Color effectiveContentColor = widget.contentColor ?? bannerTheme.contentTextStyle?.color ?? theme.colorScheme.onSurface;

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(_animation),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (widget.leading != null)
                    IconTheme(
                      data: IconThemeData(color: effectiveContentColor, size: 24),
                      child: widget.leading!,
                    ),
                  if (widget.leading != null) const SizedBox(width: 16),
                  Expanded(
                    child: DefaultTextStyle(
                      style: theme.textTheme.bodyMedium!.copyWith(color: effectiveContentColor),
                      child: widget.content,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: widget.actions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
