import 'package:flutter/material.dart';
import 'package:cirrus/src/widgets/animated_list_fade_in.dart';

/// Cirrus 设计系统中的可展开列表项。
///
/// 包含优雅的展开/折叠动画，以及旋转的箭头指示器。
/// 支持自定义前缀内容，如序号、图标或留空。
class CirrusExpansionTile extends StatefulWidget {
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
  State<CirrusExpansionTile> createState() => _CirrusExpansionTileState();
}

class _CirrusExpansionTileState extends State<CirrusExpansionTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (widget.initiallyExpanded) {
      _isExpanded = true;
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).expansionTileTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: _handleTap,
          leading: widget.leading,
          title: widget.title,
          trailing: widget.showTrailing
              ? RotationTransition(
                  turns: _iconTurns,
                  child: const Icon(Icons.expand_more),
                )
              : null,
          contentPadding: theme.tilePadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        ClipRect(
          child: Align(
            heightFactor: _controller.view.value,
            child: FadeTransition(
              opacity: _controller.view,
              child: Padding(
                padding: theme.childrenPadding ?? EdgeInsets.zero,
                child: AnimatedListFadeIn(
                  children: widget.children,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
