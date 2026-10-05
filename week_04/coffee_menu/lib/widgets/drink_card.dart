import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/drink_data.dart';
import '../theme.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({required this.drink, required this.onAdd, super.key});

  final DrinkData drink;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    final imageColor = drink.soldOut ? colors.soldOut : colors.chipBackground;
    final iconColor = drink.soldOut ? colors.onBrand : colors.brandBrown;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: colors.shadow, blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(color: imageColor, borderRadius: BorderRadius.circular(12)),
            child: Icon(drink.icon, color: iconColor, size: 36),
          ),
          const SizedBox(height: 10),
          Text(drink.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(color: colors.primaryText, fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(drink.soldOut ? 'Sold out' : drink.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(color: colors.secondaryText, fontSize: 12)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${drink.price.toStringAsFixed(2)} EGP', style: GoogleFonts.poppins(color: colors.brandBrown, fontSize: 15, fontWeight: FontWeight.w700)),
              IconButton(onPressed: drink.soldOut ? null : onAdd, icon: const Icon(Icons.add_circle), color: colors.brandBrown, disabledColor: colors.soldOut),
            ],
          ),
        ],
      ),
    );
  }
}
