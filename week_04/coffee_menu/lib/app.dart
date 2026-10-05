import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coffee_menu_page.dart';
import 'theme.dart';

class CoffeeMenuApp extends StatelessWidget {
  const CoffeeMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brandBrown = Color(0xFF6F4E37);
    const caramel = Color(0xFFD9A066);
    const pageBackground = Color(0xFFFDFBF9);
    const primaryText = Color(0xFF2B2118);
    const secondaryText = Color(0xFF6F6156);
    const chipBackground = Color(0xFFF1EAE4);
    const shadow = Color(0x10000000);
    const soldOut = Color(0xFF8A8A8A);
    final baseText = GoogleFonts.poppinsTextTheme();
    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: pageBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: brandBrown,
        primary: brandBrown,
        secondary: caramel,
        surface: Colors.white,
      ),
      textTheme: baseText.copyWith(
        bodyMedium: baseText.bodyMedium?.copyWith(color: primaryText),
        bodySmall: baseText.bodySmall?.copyWith(color: secondaryText),
        titleMedium: baseText.titleMedium?.copyWith(
          color: primaryText,
          fontWeight: FontWeight.w600,
        ),
      ),
      extensions: const [
        CoffeeColors(
          brandBrown: brandBrown,
          caramel: caramel,
          pageBackground: pageBackground,
          primaryText: primaryText,
          secondaryText: secondaryText,
          chipBackground: chipBackground,
          cardBackground: Colors.white,
          onBrand: Colors.white,
          shadow: shadow,
          soldOut: soldOut,
        ),
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Areisto Coffee',
      theme: theme,
      home: const CoffeeMenuPage(),
    );
  }
}
