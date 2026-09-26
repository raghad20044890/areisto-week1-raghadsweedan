import 'package:flutter/material.dart';

import '../theme.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    final text = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 156,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(color: colors.brandBrown),
            Positioned(right: -30, top: -40, child: _circle(colors.caramel, 126)),
            Positioned(right: 32, bottom: -62, child: _circle(colors.caramel, 132)),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _copy(colors, text)),
                  Transform.rotate(angle: -0.28, child: _discount(colors, text)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color.withOpacity(0.28), shape: BoxShape.circle),
    );
  }

  Widget _discount(CoffeeColors colors, TextTheme text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      color: colors.caramel,
      child: Text.rich(TextSpan(children: [
        TextSpan(text: '50%
', style: text.headlineSmall?.copyWith(color: colors.primaryText, fontWeight: FontWeight.w800, height: 0.95)),
        TextSpan(text: 'OFF', style: text.labelSmall?.copyWith(color: colors.primaryText)),
      ])),
    );
  }

  Widget _copy(CoffeeColors colors, TextTheme text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Special offer', style: text.bodySmall?.copyWith(color: colors.onBrand.withOpacity(0.75), fontSize: 12)),
        const SizedBox(height: 4),
        Text.rich(TextSpan(children: [
          TextSpan(text: 'Save 50%', style: text.headlineSmall?.copyWith(color: colors.onBrand, fontWeight: FontWeight.w700)),
          TextSpan(text: ' on your first order', style: text.bodySmall?.copyWith(color: colors.onBrand.withOpacity(0.82), fontSize: 11)),
        ])),
        const Spacer(),
        Wrap(spacing: 8, runSpacing: 6, children: ['New users', 'Today only'].map((label) => _pill(label, colors, text)).toList()),
      ],
    );
  }

  Widget _pill(String label, CoffeeColors colors, TextTheme text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(color: colors.onBrand.withOpacity(0.18), borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: text.labelSmall?.copyWith(color: colors.onBrand)),
    );
  }
}
