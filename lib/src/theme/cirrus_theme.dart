import 'package:flutter/material.dart';

/// Cirrus UI 库的官方主题和设计规范。
///
/// 这个类集中管理了颜色、字体、形状等设计系统的核心元素，
/// 确保所有 Cirrus 组件都具有统一、协调的视觉风格。
class CirrusTheme {
  // 基础颜色定义
  static const Color primaryBlue = Color(0xFF007AFF);
  static const Color background = Color(0xFFF5F7FA);
  static const Color cardColor = Colors.white;
  static const Color primaryText = Color(0xFF212121);
  static const Color secondaryText = Color(0xFF757575);

  /// 获取浅色模式主题数据
  static ThemeData get themeData {
    return _buildLightTheme();
  }

  /// 获取深色模式主题数据
  static ThemeData get darkThemeData {
    return _buildDarkTheme();
  }

  /// 构建浅色主题
  static ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      primaryColor: primaryBlue,
      splashFactory: InkSparkle.splashFactory,
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        background: background,
        surface: cardColor,
        onPrimary: Colors.white,
        onBackground: primaryText,
        onSurface: primaryText,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        shadowColor: Colors.black.withOpacity(0.05),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: primaryText,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: const TextStyle(color: primaryText, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: primaryBlue, width: 2.0),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        titleTextStyle: const TextStyle(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(color: secondaryText, fontSize: 16),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.white),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return Colors.grey.shade300;
        }),
        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.all(primaryBlue.withOpacity(0.1)),
      ),
      tabBarTheme: TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: primaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelColor: primaryBlue,
        unselectedLabelColor: secondaryText,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryBlue,
        linearTrackColor: Color(0xFFE0E0E0),
        linearMinHeight: 8,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade200, // 更浅的背景色
        disabledColor: Colors.grey.shade300,
        selectedColor: primaryBlue,
        secondarySelectedColor: primaryBlue,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        labelStyle: const TextStyle(color: primaryText, height: 1.2),
        secondaryLabelStyle: const TextStyle(color: Colors.white, height: 1.2),
        brightness: Brightness.light,
        shape: const StadiumBorder(), // 使用 StadiumBorder 来获取圆角
        side: BorderSide.none, // 明确移除边框
        checkmarkColor: Colors.white,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryBlue,
        inactiveTrackColor: primaryBlue.withOpacity(0.3),
        thumbColor: primaryBlue,
        overlayColor: primaryBlue.withOpacity(0.1),
        trackHeight: 6.0, // 轨道变细
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
        trackShape: const RoundedRectSliderTrackShape(),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.onlyForContinuous,
      ),
      tooltipTheme: TooltipThemeData(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: BoxDecoration(
          color: primaryBlue.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryBlue,
        contentTextStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        behavior: SnackBarBehavior.floating,
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: Colors.red, // 使用醒目的红色
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 6),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE0E0E0),
        space: 1,
        thickness: 1,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: primaryBlue,
        collapsedIconColor: secondaryText,
        textColor: primaryBlue,
        collapsedTextColor: primaryText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        textStyle: const TextStyle(color: primaryText, fontSize: 16),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: primaryBlue,
        unselectedItemColor: secondaryText,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 6,
        focusElevation: 8,
        hoverElevation: 8,
        highlightElevation: 12,
        shape: const CircleBorder(),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return secondaryText;
        }),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(primaryBlue),
          overlayColor: MaterialStateProperty.all(primaryBlue.withOpacity(0.1)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
      ),
    );
  }

  /// 构建深色主题
  static ThemeData _buildDarkTheme() {
    const darkBackground = Color(0xFF121212);
    const darkSurface = Color(0xFF1E1E1E);
    const darkPrimaryText = Color(0xFFE1E1E1);
    const darkSecondaryText = Color(0xFFB3B3B3);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: primaryBlue,
      splashFactory: InkSparkle.splashFactory,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        secondary: primaryBlue,
        surface: darkSurface,
        background: darkBackground,
        error: Color(0xFFCF6679),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: darkPrimaryText,
        onBackground: darkPrimaryText,
        onError: Colors.black,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: darkPrimaryText,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: darkPrimaryText,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        shadowColor: Colors.black.withOpacity(0.1),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        textStyle: const TextStyle(color: darkPrimaryText, fontSize: 16),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: primaryBlue, width: 2.0),
        ),
        hintStyle: const TextStyle(color: darkSecondaryText),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(darkSurface),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return Colors.grey.shade700;
        }),
        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.all(primaryBlue.withOpacity(0.2)),
      ),
      tabBarTheme: TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: primaryBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelColor: primaryBlue,
        unselectedLabelColor: darkSecondaryText,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryBlue,
        linearTrackColor: Color(0xFF333333),
        linearMinHeight: 8,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryBlue,
        inactiveTrackColor: primaryBlue.withOpacity(0.3),
        thumbColor: primaryBlue,
        overlayColor: primaryBlue.withOpacity(0.2),
        trackHeight: 6.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
        trackShape: const RoundedRectSliderTrackShape(),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.onlyForContinuous,
      ),
      tooltipTheme: TooltipThemeData(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: BoxDecoration(
          color: primaryBlue.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: darkSurface,
        contentTextStyle: const TextStyle(color: darkPrimaryText),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
        closeIconColor: darkPrimaryText,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        titleTextStyle: const TextStyle(
          color: darkPrimaryText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(color: darkSecondaryText, fontSize: 16),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 6,
        focusElevation: 8,
        hoverElevation: 8,
        highlightElevation: 12,
        shape: const CircleBorder(),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return darkSecondaryText;
        }),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(primaryBlue),
          overlayColor: MaterialStateProperty.all(primaryBlue.withOpacity(0.2)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
      ),
    );
  }
}
