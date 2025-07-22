import 'package:flutter/material.dart';

/// 导航栏是一个侧边导航组件，用于显示一列目的地。
/// 它通常用于大屏幕应用，例如平板电脑或桌面端。
///
/// `CirrusNavigationRail` 是一个高度风格化的版本，与 Cirrus 设计体系保持一致，
/// 具有流畅的动画和可定制的属性。
class CirrusNavigationRail extends StatelessWidget {
  /// 当前选定目标的索引。
  final int selectedIndex;

  /// 当用户选择一个目标时调用的回调函数。
  final ValueChanged<int> onDestinationSelected;

  /// 在导航栏中显示的目标列表。
  final List<CirrusNavigationRailDestination> destinations;

  /// 显示在导航栏顶部的可选组件。
  final Widget? leading;

  /// 显示在导航栏底部的可选组件。
  final Widget? trailing;

  /// 导航栏的背景颜色。
  final Color? backgroundColor;

  /// 选定目标的图标和标签颜色。
  final Color? selectedColor;

  /// 未选定目标的图标和标签颜色。
  final Color? unselectedColor;

  /// 创建一个 Cirrus 导航栏。
  const CirrusNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigationRailTheme = theme.navigationRailTheme;

    final Color effectiveBackgroundColor = backgroundColor ?? navigationRailTheme.backgroundColor ?? theme.colorScheme.surface;
    final Color effectiveSelectedColor = selectedColor ?? navigationRailTheme.selectedIconTheme?.color ?? theme.colorScheme.primary;
    final Color effectiveUnselectedColor = unselectedColor ?? navigationRailTheme.unselectedIconTheme?.color ?? theme.colorScheme.onSurfaceVariant;

    return Container(
      width: 80,
      color: effectiveBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(height: 24),
          ],
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(destinations.length, (index) {
                return _NavigationRailItem(
                  destination: destinations[index],
                  isSelected: selectedIndex == index,
                  selectedColor: effectiveSelectedColor,
                  unselectedColor: effectiveUnselectedColor,
                  onTap: () => onDestinationSelected(index),
                );
              }),
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(height: 24),
            trailing!,
          ],
        ],
      ),
    );
  }
}

/// 代表 [CirrusNavigationRail] 中的一个目的地。
class CirrusNavigationRailDestination {
  /// 此目的地要显示的图标。
  final IconData icon;

  /// 当此目的地被选中时要显示的图标。
  /// 如果为 null，则使用 [icon]。
  final IconData? selectedIcon;

  /// 显示在图标下方的标签。
  final String label;

  /// 创建一个导航栏目的地。
  const CirrusNavigationRailDestination({
    required this.icon,
    this.selectedIcon,
    required this.label,
  });
}

class _NavigationRailItem extends StatelessWidget {
  final CirrusNavigationRailDestination destination;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;

  const _NavigationRailItem({
    required this.destination,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color color = isSelected ? selectedColor : unselectedColor;
    final IconData icon = (isSelected ? destination.selectedIcon : null) ?? destination.icon;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 64,
        height: 64,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? selectedColor.withOpacity(0.15) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: animation, child: child),
                  );
                },
                child: Icon(
                  icon,
                  key: ValueKey<IconData>(icon),
                  color: color,
                  size: 24,
                ),
              ),
            ),

            Flexible(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: theme.textTheme.labelSmall!.copyWith(color: color, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
                child: Text(
                  destination.label,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
