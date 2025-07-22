import 'package:flutter/material.dart';

/// Cirrus 设计系统中的时间选择器。
///
/// 包含优雅的弹出动画和时间选择反馈效果。
class CirrusTimePicker extends StatelessWidget {
  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay>? onTimeSelected;
  final String? labelText;

  const CirrusTimePicker({
    super.key,
    this.initialTime,
    this.onTimeSelected,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final time = await showTimePicker(
          context: context,
          initialTime: initialTime ?? TimeOfDay.now(),
          // 样式会从 ThemeData.timePickerTheme 中获取
          // 包含了内置的弹出和选择动画效果
        );
        if (time != null && onTimeSelected != null) {
          onTimeSelected!(time);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText ?? '选择时间',
          suffixIcon: const Icon(Icons.access_time),
        ),
        child: Text(
          initialTime != null
              ? '${initialTime!.hour.toString().padLeft(2, '0')}:${initialTime!.minute.toString().padLeft(2, '0')}'
              : '请选择时间',
        ),
      ),
    );
  }
}
