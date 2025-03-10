import 'package:auracast/home/home_index.dart';

class ThemeColors {
  static const Color clrTransparent = Color(0x00ffffff);
  static const Color clrBlack = Color(0xFF000000);
  static const Color clrGreen = Colors.green;
  static const Color clrBlack50 = Color(0xFF181818);
  static const Color clrWhite = Color(0xFFffffff);
  static const Color clrGrey = Color.fromARGB(255, 145, 143, 143);
  static const Color clrProfileSettingsTelegramColor = Color(0xFF25B5E2);
  static const Color clrProfileSettingsFacebookColor = Color(0xFF4276D7);
  static const Color clrBorderColor = Color(0xFFD5D0FF);
  static const Color clrPrimaryColor20 = Color(0xFFD5D0FF);

  static const Color primaryColor = Color(0xFFB0BEC5);
  static const Color secondaryColor = Color(0xFF90A4AE);
}

List<Color> getColorList() {
  return [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
    Colors.teal,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.cyanAccent,
    Colors.limeAccent,
    Colors.indigoAccent,
    Colors.tealAccent,
  ].map((color) => color).toList();
}

class ThemeFonts {
  static const String lexend = "Lexend";
  static const String lexendDeca = "LexendDeca";
  static const String urbanist = "Urbanist";
}

class AppTheme {
  AppBarTheme appBarTheme() => const AppBarTheme(
        backgroundColor: ThemeColors.clrWhite,
        surfaceTintColor: ThemeColors.clrWhite,
        foregroundColor: ThemeColors.clrBlack,
        elevation: 2,
      );

  static TextTheme textTheme(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    const defaultTextColor = ThemeColors.clrBlack;
    const lexend = ThemeFonts.lexend;
    return TextTheme(
      headlineMedium: currentTextTheme.headlineMedium!.copyWith(
        color: defaultTextColor,
        fontFamily: lexend,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: currentTextTheme.titleLarge!.copyWith(
        color: defaultTextColor,
        fontFamily: lexend,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: currentTextTheme.titleMedium!.copyWith(
          color: defaultTextColor,
          fontFamily: lexend,
          fontWeight: FontWeight.w500),
      titleSmall: currentTextTheme.titleSmall!.copyWith(
          color: defaultTextColor,
          fontFamily: lexend,
          fontWeight: FontWeight.w400,
          fontSize: 16),
      displayLarge:
          currentTextTheme.displayLarge!.copyWith(color: defaultTextColor),
      displayMedium:
          currentTextTheme.displayMedium!.copyWith(color: defaultTextColor),
      displaySmall:
          currentTextTheme.displaySmall!.copyWith(color: defaultTextColor),
      headlineSmall:
          currentTextTheme.headlineSmall!.copyWith(color: defaultTextColor),
      labelMedium:
          currentTextTheme.titleLarge!.copyWith(color: defaultTextColor),
      bodyLarge: currentTextTheme.bodyLarge!.copyWith(color: defaultTextColor),
      bodyMedium:
          currentTextTheme.bodyMedium!.copyWith(color: defaultTextColor),
      labelLarge:
          currentTextTheme.labelLarge!.copyWith(color: defaultTextColor),
      bodySmall: currentTextTheme.bodySmall!.copyWith(color: defaultTextColor),
      labelSmall:
          currentTextTheme.labelSmall!.copyWith(color: defaultTextColor),
    );
  }

  /// Theme data for Material and Elevated button
  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // foregroundColor: ThemeColors.clrWhite,
          backgroundColor: ThemeColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );
}

class AppThemeDark {
  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      backgroundColor: ThemeColors.clrBlack,
      foregroundColor: ThemeColors.clrWhite,
      titleTextStyle: TextStyle(color: ThemeColors.clrWhite),
    );
  }

  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ThemeColors.clrWhite,
          backgroundColor: ThemeColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );
}

ThemeData lightTheme(BuildContext context) => ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: ThemeColors.primaryColor,
      primaryColorDark: ThemeColors.clrBlack50,
      scaffoldBackgroundColor: ThemeColors.clrWhite,
      appBarTheme: AppTheme().appBarTheme(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ThemeColors.primaryColor,
        selectionColor: ThemeColors.primaryColor.withOpacity(0.4),
        selectionHandleColor: ThemeColors.primaryColor,
      ),
      useMaterial3: true,
      focusColor: ThemeColors.primaryColor,
      fontFamily: ThemeFonts.lexend,
      elevatedButtonTheme: AppTheme.elevatedButtonThemeData(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeColors.clrBlack,
      ),
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      colorSchemeSeed: ThemeColors.primaryColor,
      scaffoldBackgroundColor: ThemeColors.clrBlack,
      brightness: Brightness.dark,
      useMaterial3: true,
      appBarTheme: AppThemeDark.appBarTheme(),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ThemeColors.primaryColor,
        selectionColor: ThemeColors.primaryColor,
        selectionHandleColor: ThemeColors.primaryColor,
      ),
      focusColor: ThemeColors.primaryColor,
      elevatedButtonTheme: AppThemeDark.elevatedButtonThemeData(),
      fontFamily: ThemeFonts.lexend,
    );
