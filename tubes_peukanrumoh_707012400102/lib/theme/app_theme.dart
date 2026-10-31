import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color seedTeal = Color(0xFF11998E);

  static ThemeData get lightTheme {
    final skema = ColorScheme.fromSeed(
      seedColor: seedTeal,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: skema,
      scaffoldBackgroundColor: const Color(0xFFF6FAF9),
      appBarTheme: AppBarTheme(
        backgroundColor: skema.surface,
        foregroundColor: skema.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: skema.onSurface,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: skema.surface,
        hintStyle: TextStyle(color: skema.outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: skema.primary,
        contentTextStyle: TextStyle(
          color: skema.onPrimary,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: skema.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: skema.primary.withValues(alpha: 0.14),
        height: 66,
      ),
    );
  }

  static ThemeData get darkTheme {
    final skema = ColorScheme.fromSeed(
      seedColor: seedTeal,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: skema,
      scaffoldBackgroundColor: const Color(0xFF0E1413),
      appBarTheme: AppBarTheme(
        backgroundColor: skema.surface,
        foregroundColor: skema.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: skema.onSurface,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: skema.surface,
        hintStyle: TextStyle(color: skema.outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: skema.primary,
        contentTextStyle: TextStyle(
          color: skema.onPrimary,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: skema.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: skema.primary.withValues(alpha: 0.30),
        height: 66,
      ),
    );
  }
}
