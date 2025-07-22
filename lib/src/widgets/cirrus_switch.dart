import 'package:flutter/material.dart';

/// Cirrus 设计系统中的开关组件。
///
/// 这是一个对 Flutter 原生 [Switch] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
/// 它会自动应用主题中定义的滑块颜色、轨道颜色和悬浮效果。
class CirrusSwitch extends StatelessWidget {
  /// 当前开关是否开启。
  final bool value;

  /// 当用户切换开关状态时调用的回调函数。
  final ValueChanged<bool>? onChanged;

  /// 创建一个 Cirrus 开关组件。
  const CirrusSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    // 直接使用 Flutter 的 Switch，
    // 它会自动从 context 的 ThemeData.switchTheme 中获取样式。
    return Switch(value: value, onChanged: onChanged);
  }
}
