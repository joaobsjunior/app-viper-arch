import 'package:flutter/material.dart';
import 'theme_tokens.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          ThemeTokens.primaryColor.value,
          const {
            50: ThemeTokens.primaryColorLight,
            100: ThemeTokens.primaryColorLight,
            200: ThemeTokens.primaryColorLight,
            300: ThemeTokens.primaryColorLight,
            400: ThemeTokens.primaryColorLight,
            500: ThemeTokens.primaryColor,
            600: ThemeTokens.primaryColorDark,
            700: ThemeTokens.primaryColorDark,
            800: ThemeTokens.primaryColorDark,
            900: ThemeTokens.primaryColorDark,
          },
        ),
        accentColor: ThemeTokens.highlightColor,
        backgroundColor: ThemeTokens.backgroundColor,
      ),
      scaffoldBackgroundColor: ThemeTokens.backgroundColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: ThemeTokens.primaryColor,
          fontSize: ThemeTokens.fontSizeTitle,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: ThemeTokens.primaryColor,
          fontSize: ThemeTokens.fontSizeTitle,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: ThemeTokens.primaryColor,
          fontSize: ThemeTokens.fontSizeTitle,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: ThemeTokens.textPrimaryColor,
          fontSize: ThemeTokens.fontSizeBody,
        ),
        bodyMedium: TextStyle(
          color: ThemeTokens.textSecondaryColor,
          fontSize: ThemeTokens.fontSizeBody,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ThemeTokens.secondaryColor, // Cor do texto e do ícone
          backgroundColor: ThemeTokens.primaryColor, // Cor de fundo do botão
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeTokens.paddingMedium,
            vertical: ThemeTokens.paddingSmall,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeTokens.borderRadiusSmall),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: ThemeTokens.secondaryColor,
        shadowColor: ThemeTokens.backgroundDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeTokens.borderRadiusMedium),
        ),
        margin: const EdgeInsets.all(ThemeTokens.paddingMedium),
      ),
    );
  }
}