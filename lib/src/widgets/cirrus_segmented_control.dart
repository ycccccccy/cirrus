import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 分段控件是一个由两个或多个部分组成的线性集合，每个部分都充当一个互斥的按钮。
///
/// `CirrusSegmentedControl` 提供了一个高度风格化、带动画且可定制的实现，
/// 可无缝地融入 Cirrus 设计体系。
class CirrusSegmentedControl<T> extends StatefulWidget {
  /// 在分段控件中显示的选项列表。
  final List<SegmentedControlOption<T>> options;

  /// 当前选中的值。
  final T selectedValue;

  /// 当用户选择一个新的分段时调用的回调函数。
  final ValueChanged<T> onValueChanged;

  /// 控件的背景颜色。
  final Color? backgroundColor;

  /// 滑动指示器的颜色。
  final Color? indicatorColor;

  /// 标签的文本样式。
  final TextStyle? textStyle;

  /// 创建一个 Cirrus 分段控件。
  const CirrusSegmentedControl({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onValueChanged,
    this.backgroundColor,
    this.indicatorColor,
    this.textStyle,
  });

  @override
  State<CirrusSegmentedControl<T>> createState() => _CirrusSegmentedControlState<T>();
}

class _CirrusSegmentedControlState<T> extends State<CirrusSegmentedControl<T>> {
  int get selectedIndex => widget.options.indexWhere((opt) => opt.value == widget.selectedValue);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color effectiveBackgroundColor = widget.backgroundColor ?? theme.colorScheme.surfaceVariant.withOpacity(0.5);
    final Color effectiveIndicatorColor = widget.indicatorColor ?? theme.colorScheme.primary;
    final TextStyle effectiveTextStyle = widget.textStyle ?? theme.textTheme.labelLarge ?? const TextStyle();

    return LayoutBuilder(builder: (context, constraints) {
      final itemWidth = constraints.maxWidth / widget.options.length;

      return Container(
        height: 48,
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Stack(
            children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              left: selectedIndex * itemWidth,
              child: Container(
                width: itemWidth,
                height: 40, // Height of the indicator, should match the tappable area height
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: effectiveIndicatorColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: widget.options.map((option) {
                final index = widget.options.indexOf(option);
                final isSelected = index == selectedIndex;

                return Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.onValueChanged(option.value);
                      HapticFeedback.lightImpact();
                    },
                    customBorder: const StadiumBorder(),
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: theme.colorScheme.onSurface.withOpacity(0.1),
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: effectiveTextStyle.copyWith(
                          color: isSelected ? effectiveIndicatorColor.computeLuminance() > 0.5 ? Colors.black : Colors.white : theme.colorScheme.onSurfaceVariant,
                        ),
                        child: Text(option.label),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),      ),
      );
    });
  }
}

/// 代表 [CirrusSegmentedControl] 中的一个选项。
class SegmentedControlOption<T> {
  /// 此选项要显示的文本。
  final String label;

  /// 与此选项关联的值。
  final T value;

  /// 创建一个分段控件选项。
  const SegmentedControlOption({required this.label, required this.value});
}
