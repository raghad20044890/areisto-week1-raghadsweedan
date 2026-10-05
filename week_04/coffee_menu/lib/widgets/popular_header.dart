import 'package:flutter/material.dart';

import '../theme.dart';

class PopularHeader extends StatelessWidget {
  const PopularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        Text('Popular', style: text.titleMedium?.copyWith(color: colors.primaryText, fontSize: 18)),
        const Spacer(),
        Text('See all', style: text.bodySmall?.copyWith(color: colors.brandBrown, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
