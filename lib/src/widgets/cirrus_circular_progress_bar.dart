import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Cirrus 设计系统中的圆形进度条。
///
/// 包含优雅的旋转动画和颜色过渡效果，使用第三方库增强视觉体验。
class CirrusCircularProgressBar extends StatelessWidget {
  final double? value;
  final Color? color;
  final double strokeWidth;
  final bool showAnimation;

  const CirrusCircularProgressBar({
    super.key,
    this.value,
    this.color,
    this.strokeWidth = 4.0,
    this.showAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    final progressColor = color ?? Theme.of(context).colorScheme.primary;

    if (value != null) {
      // 确定进度的圆形进度条，使用增强动画
      return CircularPercentIndicator(
        radius: 30.0,
        lineWidth: strokeWidth,
        percent: value!.clamp(0.0, 1.0),
        center: Text(
          '${(value! * 100).toInt()}%',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            color: progressColor,
          ),
        ),
        progressColor: progressColor,
        backgroundColor: progressColor.withAlpha(51),
        circularStrokeCap: CircularStrokeCap.round,
        animation: showAnimation,
        animationDuration: 1000,
      );
    } else {
      // 不确定进度的圆形进度条，使用原生动画
      return CircularProgressIndicator(
        color: progressColor,
        strokeWidth: strokeWidth,
      );
    }
  }
}
