import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// 🎨 Brand & UI Colors
class Palette {
  // Brand
  static const Color primary = Color(0xFF1565C0); // Deep Blue
  static const Color secondary = Color(0xFF2E7D32); // Green

  // Backgrounds
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);

  // Surfaces
  static const Color cardLight = Color(0xFFF5F5F5);
  static const Color cardDark = Color(0xFF1E1E1E);

  // Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  // Status
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA000);
  static const Color error = Color(0xFFD32F2F);

  // Borders
  static const Color border = Color(0xFFE0E0E0);
}

/// 📏 Spacing system (used in padding/margin)
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

/// 🌫 Shadows & Elevation
class AppShadows {
  static final soft = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 4,
      offset: const Offset(0, 2),
    )
  ];

  static final medium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 4),
    )
  ];

  static final strong = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 16,
      offset: const Offset(0, 6),
    )
  ];
}

/// ✍️ Typography system
class AppTypography {
  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Palette.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: Colors.white,
  );
}

class AppTheme {

  static final ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Palette.backgroundLight,
    primaryColor: Palette.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: Palette.textPrimary),
      titleTextStyle: AppTypography.h2,
    ),
    cardColor: Palette.cardLight,
    colorScheme: const ColorScheme.light(
      primary: Palette.primary,
      secondary: Palette.secondary,
      background: Palette.backgroundLight,
      surface: Palette.cardLight,
      error: Palette.error,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTypography.h1,
      headlineMedium: AppTypography.h2,
      bodyLarge: AppTypography.body,
      bodyMedium: AppTypography.bodySmall,
      bodySmall: AppTypography.caption,
      labelLarge: AppTypography.button,
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.backgroundDark,
    primaryColor: Palette.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: AppTypography.h2,
    ),
    cardColor: Palette.cardDark,
    colorScheme: const ColorScheme.dark(
      primary: Palette.primary,
      secondary: Palette.secondary,
      background: Palette.backgroundDark,
      surface: Palette.cardDark,
      error: Palette.error,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTypography.h1,
      headlineMedium: AppTypography.h2,
      bodyLarge: AppTypography.body,
      bodyMedium: AppTypography.bodySmall,
      bodySmall: AppTypography.caption,
      labelLarge: AppTypography.button,
    ),
  );

}
final themeNotifierProvider =
NotifierProvider<ThemeNotifier, ThemeData>(ThemeNotifier.new);



 class ThemeNotifier extends Notifier<ThemeData>{
     ThemeMode _mode=ThemeMode.light;

     @override
   ThemeData build(){
       _loadTheme();
       return AppTheme.light;
     }
     ThemeMode get mode=>_mode;

     Future<void> _loadTheme()  async{
       final prefs=await SharedPreferences.getInstance();
       final theme=prefs.getString('theme');
       if(theme=='dark'){
         _mode=ThemeMode.dark;
         state=AppTheme.dark;
       }
       else{
         _mode=ThemeMode.light;
         state=AppTheme.light;
       }
     }

     Future<void> toggleTheme() async{
       final prefs= await SharedPreferences.getInstance();
       if(_mode==ThemeMode.dark)
         {
           _mode=ThemeMode.light;
           state=AppTheme.light;
           prefs.setString('theme', 'light');
         }else{
         _mode=ThemeMode.dark;
         state=AppTheme.dark;
         prefs.setString('theme', 'dark');

       }


     }
  }



