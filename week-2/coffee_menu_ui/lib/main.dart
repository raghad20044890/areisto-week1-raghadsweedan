import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';
import 'widgets/coffee_widgets.dart';

void main() {
  runApp(const CoffeeMenuApp());
}

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
      extensions: const <ThemeExtension<dynamic>>[
        CoffeeColors(
          primaryText: primaryText,
          secondaryText: secondaryText,
          brandBrown: brandBrown,
          caramel: caramel,
          chipBackground: chipBackground,
          pageBackground: pageBackground,
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

class CoffeeMenuPage extends StatelessWidget {
  const CoffeeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GreetingRow(),
              SizedBox(height: 20),
              SearchBarBox(),
              SizedBox(height: 20),
              CategoryChips(),
              SizedBox(height: 24),
              OfferCard(),
              SizedBox(height: 24),
              PopularHeader(),
              SizedBox(height: 12),
              DrinkGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CoffeeBottomBar(),
    );
  }
}
