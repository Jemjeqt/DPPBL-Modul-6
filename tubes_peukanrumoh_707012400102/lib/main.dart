import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/favorit_cubit.dart';
import 'cubit/keranjang_cubit.dart';
import 'cubit/theme_cubit.dart';
import 'navigation/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PeukanRumohApp());
}

class PeukanRumohApp extends StatelessWidget {
  const PeukanRumohApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KeranjangCubit>(create: (_) => KeranjangCubit()),
        BlocProvider<FavoritCubit>(create: (_) => FavoritCubit()),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Peukan Rumoh',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            initialRoute: AppRoutes.beranda,
            onGenerateRoute: AppRoutesHelper.onGenerateRoute,
            onUnknownRoute: AppRoutesHelper.onUnknownRoute,
          );
        },
      ),
    );
  }
}
