import 'dart:async';
import 'package:flutter/material.dart';

/// 一个为子组件列表提供交错淡入和上移动画的辅助组件。
///
/// 当这个组件构建时，它的子组件会以一个轻微的延迟逐个出现，
/// 创造出一种流畅且引人注目的动画效果。
class AnimatedListFadeIn extends StatefulWidget {
  /// 要进行动画处理的子组件列表。
  final List<Widget> children;

  /// 每个子组件动画开始之间的延迟时间。
  final Duration staggerDuration;

  /// 每个子组件的动画时长。
  final Duration animationDuration;

  /// 创建一个 `AnimatedListFadeIn` 组件。
  const AnimatedListFadeIn({
    super.key,
    required this.children,
    this.staggerDuration = const Duration(milliseconds: 50),
    this.animationDuration = const Duration(milliseconds: 400),
  });

  @override
  State<AnimatedListFadeIn> createState() => _AnimatedListFadeInState();
}

class _AnimatedListFadeInState extends State<AnimatedListFadeIn> {
  final List<Widget> _animatedChildren = [];

  @override
  void initState() {
    super.initState();
    _animateChildren();
  }

  void _animateChildren() {
    for (int i = 0; i < widget.children.length; i++) {
      Timer(widget.staggerDuration * i, () {
        if (mounted) {
          setState(() {
            _animatedChildren.add(_AnimatedListItem(
              animationDuration: widget.animationDuration,
              child: widget.children[i],
            ));
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _animatedChildren,
    );
  }
}

class _AnimatedListItem extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;

  const _AnimatedListItem({
    required this.child,
    required this.animationDuration,
  });

  @override
  State<_AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<_AnimatedListItem> {
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _isAnimated = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.animationDuration,
      opacity: _isAnimated ? 1.0 : 0.0,
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: widget.animationDuration,
        transform: Matrix4.translationValues(0, _isAnimated ? 0 : 20, 0),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
