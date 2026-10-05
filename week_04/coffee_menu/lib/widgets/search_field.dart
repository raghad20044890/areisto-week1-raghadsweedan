import 'package:flutter/material.dart';

import '../theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: colors.cardBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: colors.chipBackground),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: colors.secondaryText, size: 20),
                const SizedBox(width: 10),
                Text('Search coffee', style: text.bodyMedium?.copyWith(color: colors.secondaryText, fontSize: 14)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(color: colors.brandBrown, borderRadius: BorderRadius.circular(14)),
          child: Icon(Icons.tune, color: colors.onBrand, size: 21),
        ),
      ],
    );
  }
}
