import 'package:flutter/material.dart';

import '../theme.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({required this.label, required this.selected, super.key});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? colors.brandBrown : colors.chipBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: text.bodySmall?.copyWith(color: selected ? colors.onBrand : colors.primaryText, fontWeight: FontWeight.w500)),
    );
  }
}
