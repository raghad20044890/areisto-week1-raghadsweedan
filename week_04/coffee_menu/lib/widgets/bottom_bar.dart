import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/order.dart';
import '../theme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({required this.order, super.key});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    final summary = order.itemCount == 0 ? 'No items yet' : '${order.itemCount} items · ${order.total.toStringAsFixed(2)} EGP';
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
      color: colors.cardBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(summary, style: GoogleFonts.poppins(color: colors.primaryText, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home_rounded, color: colors.brandBrown),
              Icon(Icons.favorite_border, color: colors.secondaryText),
              Icon(Icons.receipt_long_outlined, color: colors.secondaryText),
              Icon(Icons.person_outline, color: colors.secondaryText),
            ],
          ),
        ],
      ),
    );
  }
}
