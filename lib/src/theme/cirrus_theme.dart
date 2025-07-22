import 'package:flutter/material.dart';

/// Cirrus UI 库的官方主题和设计规范。
///
/// 这个类集中管理了颜色、字体、形状等设计系统的核心元素，
/// 确保所有 Cirrus 组件都具有统一、协调的视觉风格。
class _AppDimensions {
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 16.0;
  static const double paddingXLarge = 24.0;
  static const double paddingXXLarge = 32.0;
}

class CirrusTheme {
  // 基础颜色定义
  static const Color primaryBlue = Color(0xFF007AFF);

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
      scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      primaryColor: primaryBlue,
      splashFactory: InkSparkle.splashFactory,
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        surface: cardColor,
        onPrimary: Colors.white,
        onSurface: primaryText,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusLarge),
        ),
        shadowColor: Colors.black.withAlpha(13),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          ),
          padding: const EdgeInsets.symmetric(horizontal: _AppDimensions.paddingXXLarge, vertical: _AppDimensions.paddingLarge),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
        padding: const EdgeInsets.symmetric(horizontal: _AppDimensions.paddingXLarge, vertical: _AppDimensions.paddingMedium),
        buttonColor: primaryBlue,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryText,
        centerTitle: false,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        titleTextStyle: const TextStyle(
          color: primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600, // Bolder title
        ),
        actionsIconTheme: const IconThemeData(
          color: primaryText,
          size: 24,
        ),
        iconTheme: const IconThemeData(
          color: primaryText,
          size: 24,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: _AppDimensions.paddingLarge, vertical: _AppDimensions.paddingMedium),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          borderSide: const BorderSide(color: primaryBlue, width: 2.0),
        ),
        hintStyle: const TextStyle(color: secondaryText),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusLarge),
        ),
        titleTextStyle: const TextStyle(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(color: secondaryText, fontSize: 16),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(Colors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return Colors.grey.shade300;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.all(primaryBlue.withAlpha(26)),
      ),
      tabBarTheme: TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: primaryBlue.withAlpha(26),
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusSmall),
        ),
        labelColor: primaryBlue,
        unselectedLabelColor: secondaryText,
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryBlue,
        linearTrackColor: const Color(0xFFEEEEEE),
        linearMinHeight: 8,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade200,
        disabledColor: Colors.grey.shade300,
        selectedColor: primaryBlue,
        secondarySelectedColor: primaryBlue,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        labelStyle: const TextStyle(color: primaryText, height: 1.2),
        secondaryLabelStyle: const TextStyle(color: Colors.white, height: 1.2),
        brightness: Brightness.light,
        shape: const StadiumBorder(),
        side: BorderSide.none,
        checkmarkColor: Colors.white,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryBlue,
        inactiveTrackColor: primaryBlue.withAlpha(77),
        thumbColor: primaryBlue,
        overlayColor: primaryBlue.withAlpha(26),
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
          color: primaryBlue.withAlpha(230),
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusSmall),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryBlue,
        contentTextStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusSmall)),
        behavior: SnackBarBehavior.floating,
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: Colors.red,
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
        tilePadding: const EdgeInsets.symmetric(horizontal: _AppDimensions.paddingMedium, vertical: _AppDimensions.paddingSmall),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xFFF5F7FA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
        elevation: 8,
        textStyle: const TextStyle(color: primaryText, fontSize: 16),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFFF5F7FA),
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
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return secondaryText;
        }),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(primaryText),
          overlayColor: WidgetStateProperty.all(primaryBlue.withAlpha(26)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: _AppDimensions.paddingLarge,
          vertical: _AppDimensions.paddingSmall,
        ),
      ),
    );
  }

  /// 构建深色主题
  static ThemeData _buildDarkTheme() {
    const Color darkBackground = Color(0xFF121212);
    const Color darkSurface = Color(0xFF1E1E1E);
    const Color darkPrimaryText = Color(0xFFE0E0E0);
    const Color darkSecondaryText = Color(0xFFBDBDBD);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: primaryBlue,
      splashFactory: InkSparkle.splashFactory,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        surface: darkSurface,
        onPrimary: Colors.white,
        onSurface: darkPrimaryText,
        secondary: primaryBlue,
        error: Color(0xFFCF6679),
        onError: Colors.black,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: darkPrimaryText,
        centerTitle: false,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade800,
            width: 0.5,
          ),
        ),
        titleTextStyle: const TextStyle(
          color: darkPrimaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600, // Bolder title
        ),
        actionsIconTheme: const IconThemeData(
          color: darkPrimaryText,
          size: 24,
        ),
        iconTheme: const IconThemeData(
          color: darkPrimaryText,
          size: 24,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusLarge),
        ),
        shadowColor: Colors.black.withAlpha(51),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          ),
          padding: const EdgeInsets.symmetric(horizontal: _AppDimensions.paddingXXLarge, vertical: _AppDimensions.paddingLarge),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
        elevation: 8,
        textStyle: const TextStyle(color: darkPrimaryText, fontSize: 16),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: _AppDimensions.paddingLarge, vertical: _AppDimensions.paddingMedium),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
          borderSide: const BorderSide(color: primaryBlue, width: 2.0),
        ),
        hintStyle: const TextStyle(color: darkSecondaryText),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(darkSurface),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return Colors.grey.shade700;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.all(primaryBlue.withAlpha(51)),
      ),
      tabBarTheme: TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: primaryBlue.withAlpha(51),
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusSmall),
        ),
        labelColor: primaryBlue,
        unselectedLabelColor: darkSecondaryText,
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryBlue,
        linearTrackColor: const Color(0xFF333333),
        linearMinHeight: 8,
        circularTrackColor: Colors.grey.shade800,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryBlue,
        inactiveTrackColor: primaryBlue.withAlpha(77),
        thumbColor: primaryBlue,
        overlayColor: primaryBlue.withAlpha(51),
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
          color: primaryBlue.withAlpha(230),
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusSmall),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: darkSurface,
        contentTextStyle: const TextStyle(color: darkPrimaryText),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
        closeIconColor: darkPrimaryText,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusLarge),
        ),
        titleTextStyle: const TextStyle(
          color: darkPrimaryText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(
          color: darkSecondaryText,
          fontSize: 16,
        ),
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
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return darkSecondaryText;
        }),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(primaryBlue),
          overlayColor: WidgetStateProperty.all(primaryBlue.withAlpha(51)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_AppDimensions.borderRadiusMedium),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: _AppDimensions.paddingLarge,
          vertical: _AppDimensions.paddingSmall,
        ),
      ),
    );
  }
}
