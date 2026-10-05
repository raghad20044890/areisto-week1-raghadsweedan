import 'package:flutter/material.dart';

import '../theme.dart';

class GreetingRow extends StatelessWidget {
  const GreetingRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning', style: text.bodyMedium?.copyWith(color: colors.secondaryText, fontSize: 14)),
              const SizedBox(height: 2),
              Text('Sara', style: text.titleLarge?.copyWith(color: colors.primaryText, fontSize: 22, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: colors.chipBackground, shape: BoxShape.circle),
          child: Text('S', style: text.titleSmall?.copyWith(color: colors.brandBrown, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
