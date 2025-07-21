import 'package:flutter/material.dart';

/// Cirrus 设计系统中的日期选择器。
///
/// 包含优雅的弹出动画和日期选择反馈效果。
class CirrusDatePicker extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime>? onDateSelected;
  final String? labelText;

  const CirrusDatePicker({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(1900),
          lastDate: lastDate ?? DateTime(2100),
          // 样式会从 ThemeData.datePickerTheme 中获取
          // 包含了内置的弹出和选择动画效果
        );
        if (date != null && onDateSelected != null) {
          onDateSelected!(date);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText ?? '选择日期',
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        child: Text(
          initialDate != null 
            ? '${initialDate!.year}-${initialDate!.month.toString().padLeft(2, '0')}-${initialDate!.day.toString().padLeft(2, '0')}'
            : '请选择日期',
        ),
      ),
    );
  }
}
