import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _seed = Color(0xFF0F6656);
  static const Color _aksen = Color(0xFFDA9A34);
  static const Color _tintaPadaAksen = Color(0xFF1B231F);

  static TextStyle gayaEyebrow(BuildContext context) => TextStyle(
    fontSize: 11.5,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.6,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );

  static ThemeData get lightTheme {
    final skema =
        ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.light,
        ).copyWith(
          primary: _seed,
          secondary: _aksen,
          onSecondary: _tintaPadaAksen,
          surface: const Color(0xFFF5F6F4),
          surfaceContainerLow: const Color(0xFFFFFFFF),
          onSurface: const Color(0xFF1B231F),
          onSurfaceVariant: const Color(0xFF5B655F),
          outlineVariant: const Color(0xFFE1E4E1),
        );
    return _bangunTema(skema);
  }

  static ThemeData get darkTheme {
    final skema = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.dark,
    ).copyWith(secondary: _aksen, onSecondary: _tintaPadaAksen);
    return _bangunTema(skema);
  }

  static ThemeData _bangunTema(ColorScheme skema) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: skema,
      scaffoldBackgroundColor: skema.surface,
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          height: 1.15,
          color: skema.onSurface,
        ),
        titleLarge: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: skema.onSurface,
        ),
        titleMedium: TextStyle(
          fontSize: 15.5,
          fontWeight: FontWeight.w600,
          color: skema.onSurface,
        ),
        bodyLarge: TextStyle(fontSize: 15, height: 1.5, color: skema.onSurface),
        bodyMedium: TextStyle(
          fontSize: 13.5,
          height: 1.45,
          color: skema.onSurfaceVariant,
        ),
        labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: skema.surface,
        foregroundColor: skema.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: skema.onSurfaceVariant,
        ),
      ),
      cardTheme: CardThemeData(
        color: skema.surfaceContainerLow,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: skema.outlineVariant),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: skema.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: skema.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: skema.onSurface,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: 13,
          color: skema.onSurfaceVariant,
        ),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: skema.onSurface,
        unselectedLabelColor: skema.onSurfaceVariant,
        labelStyle: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w500,
        ),
        indicatorColor: skema.primary,
        dividerColor: skema.outlineVariant,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: skema.surfaceContainerLow,
        indicatorColor: Colors.transparent,
        elevation: 0,
        height: 64,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final aktif = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 11.5,
            fontWeight: aktif ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: 0.2,
            color: aktif ? skema.onSurface : skema.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final aktif = states.contains(WidgetState.selected);
          return IconThemeData(
            color: aktif ? skema.primary : skema.onSurfaceVariant,
          );
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: skema.surfaceContainerLow,
        selectedIconTheme: IconThemeData(color: skema.primary),
        unselectedIconTheme: IconThemeData(color: skema.onSurfaceVariant),
        selectedLabelTextStyle: TextStyle(
          color: skema.onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 13.5,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: skema.onSurfaceVariant,
          fontSize: 13,
        ),
        indicatorColor: Colors.transparent,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: skema.surfaceContainerLow),
      badgeTheme: BadgeThemeData(
        backgroundColor: skema.secondary,
        textColor: skema.onSecondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: skema.onSurface,
          foregroundColor: skema.surface,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: skema.onSurface,
          side: BorderSide(color: skema.outlineVariant),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: skema.primary,
        foregroundColor: skema.onPrimary,
        shape: const CircleBorder(),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: skema.inverseSurface,
        contentTextStyle: TextStyle(color: skema.onInverseSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
