import 'package:flutter/material.dart';

class CoffeeColors extends ThemeExtension<CoffeeColors> {
  const CoffeeColors({
    required this.primaryText,
    required this.secondaryText,
    required this.brandBrown,
    required this.caramel,
    required this.chipBackground,
    required this.pageBackground,
  });

  final Color primaryText;
  final Color secondaryText;
  final Color brandBrown;
  final Color caramel;
  final Color chipBackground;
  final Color pageBackground;

  @override
  CoffeeColors copyWith({
    Color? primaryText,
    Color? secondaryText,
    Color? brandBrown,
    Color? caramel,
    Color? chipBackground,
    Color? pageBackground,
  }) {
    return CoffeeColors(
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      brandBrown: brandBrown ?? this.brandBrown,
      caramel: caramel ?? this.caramel,
      chipBackground: chipBackground ?? this.chipBackground,
      pageBackground: pageBackground ?? this.pageBackground,
    );
  }

  @override
  CoffeeColors lerp(ThemeExtension<CoffeeColors>? other, double t) {
    if (other is! CoffeeColors) return this;
    return CoffeeColors(
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      brandBrown: Color.lerp(brandBrown, other.brandBrown, t)!,
      caramel: Color.lerp(caramel, other.caramel, t)!,
      chipBackground: Color.lerp(chipBackground, other.chipBackground, t)!,
      pageBackground: Color.lerp(pageBackground, other.pageBackground, t)!,
    );
  }
}
