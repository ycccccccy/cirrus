import 'package:flutter/material.dart';

/// Cirrus 设计系统中的徽标。
class CirrusBadge extends StatelessWidget {
  final Widget child;
  final String label;
  final bool isVisible;

  const CirrusBadge({
    super.key,
    required this.child,
    required this.label,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(label: Text(label), isLabelVisible: isVisible, child: child);
  }
}
