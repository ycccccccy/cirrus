import 'package:flutter/material.dart';

/// Cirrus 设计系统中的用户头像。
class CirrusAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double radius;

  const CirrusAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.radius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(initials ?? '', style: TextStyle(fontSize: radius * 0.8))
          : null,
    );
  }
}
