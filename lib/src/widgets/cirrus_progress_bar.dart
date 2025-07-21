import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Cirrus 设计系统中的线性进度条。
///
/// 使用第三方库增强动画效果，确保外观和交互遵循 [CirrusTheme] 规范。
class CirrusProgressBar extends StatelessWidget {
  final double? value;
  final bool showAnimation;
  final bool showPercentage;

  const CirrusProgressBar({
    super.key,
    this.value,
    this.showAnimation = true,
    this.showPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).progressIndicatorTheme;
    final height = theme.linearMinHeight ?? 8.0;
    final progressColor = theme.color ?? Theme.of(context).colorScheme.primary;
    final bgColor = theme.linearTrackColor ?? progressColor.withOpacity(0.2);
    
    if (value != null) {
      // 确定进度的线性进度条，使用增强动画
      return LinearPercentIndicator(
        lineHeight: height,
        percent: value!.clamp(0.0, 1.0),
        progressColor: progressColor,
        backgroundColor: bgColor,
        barRadius: Radius.circular(height / 2),
        animation: showAnimation,
        animationDuration: 1000,
        clipLinearGradient: true,
        trailing: showPercentage 
          ? Text(
              '${(value! * 100).toInt()}%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: progressColor,
              ),
            )
          : null,
      );
    } else {
      // 不确定进度的线性进度条，使用原生动画
      return LinearProgressIndicator(
        color: progressColor,
        backgroundColor: bgColor,
        minHeight: height,
      );
    }
  }
}
