import 'package:flutter/material.dart';

class CoffeeColors extends ThemeExtension<CoffeeColors> {
  const CoffeeColors({
    required this.brandBrown,
    required this.caramel,
    required this.pageBackground,
    required this.primaryText,
    required this.secondaryText,
    required this.chipBackground,
    required this.cardBackground,
    required this.onBrand,
    required this.shadow,
    required this.soldOut,
  });

  final Color brandBrown;
  final Color caramel;
  final Color pageBackground;
  final Color primaryText;
  final Color secondaryText;
  final Color chipBackground;
  final Color cardBackground;
  final Color onBrand;
  final Color shadow;
  final Color soldOut;

  @override
  CoffeeColors copyWith({
    Color? brandBrown,
    Color? caramel,
    Color? pageBackground,
    Color? primaryText,
    Color? secondaryText,
    Color? chipBackground,
    Color? cardBackground,
    Color? onBrand,
    Color? shadow,
    Color? soldOut,
  }) {
    return CoffeeColors(
      brandBrown: brandBrown ?? this.brandBrown,
      caramel: caramel ?? this.caramel,
      pageBackground: pageBackground ?? this.pageBackground,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      chipBackground: chipBackground ?? this.chipBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      onBrand: onBrand ?? this.onBrand,
      shadow: shadow ?? this.shadow,
      soldOut: soldOut ?? this.soldOut,
    );
  }

  @override
  CoffeeColors lerp(ThemeExtension<CoffeeColors>? other, double t) {
    if (other is! CoffeeColors) return this;
    return CoffeeColors(
      brandBrown: Color.lerp(brandBrown, other.brandBrown, t)!,
      caramel: Color.lerp(caramel, other.caramel, t)!,
      pageBackground: Color.lerp(pageBackground, other.pageBackground, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      chipBackground: Color.lerp(chipBackground, other.chipBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      onBrand: Color.lerp(onBrand, other.onBrand, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      soldOut: Color.lerp(soldOut, other.soldOut, t)!,
    );
  }
}
