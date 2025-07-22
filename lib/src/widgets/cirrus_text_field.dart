import 'package:flutter/material.dart';

/// Cirrus 设计系统中的文本输入框。
///
/// 这是一个对 Flutter 原生 [TextField] 的封装，以确保其外观和交互
/// 始终遵循 [CirrusTheme] 中定义的统一设计规范。
class CirrusTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  const CirrusTextField({super.key, this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    // TextField 会自动从 context 的 ThemeData.inputDecorationTheme 中获取样式
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
