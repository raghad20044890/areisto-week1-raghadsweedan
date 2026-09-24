import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class GreetingRow extends StatelessWidget {
  const GreetingRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colors.secondaryText,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                'Sara',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: colors.primaryText,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors.chipBackground,
            shape: BoxShape.circle,
          ),
          child: Text(
            'S',
            style: GoogleFonts.poppins(
              color: colors.brandBrown,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBarBox extends StatelessWidget {
  const SearchBarBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: colors.chipBackground),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: colors.secondaryText, size: 20),
                const SizedBox(width: 10),
                Text(
                  'Search coffee',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.secondaryText,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.brandBrown,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.tune, color: Colors.white, size: 21),
        ),
      ],
    );
  }
}

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    const categories = ['All', 'Coffee', 'Tea', 'Juice'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var index = 0; index < categories.length; index++) ...[
            _CategoryChip(
              label: categories[index],
              selected: index == 0,
              colors: colors,
            ),
            if (index != categories.length - 1) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.colors,
  });

  final String label;
  final bool selected;
  final CoffeeColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? colors.brandBrown : colors.chipBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: selected ? Colors.white : colors.primaryText,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 156,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(color: colors.brandBrown),
            Positioned(
              right: -30,
              top: -40,
              child: _PaleCircle(size: 126, color: colors.caramel),
            ),
            Positioned(
              right: 32,
              bottom: -62,
              child: _PaleCircle(size: 132, color: colors.caramel),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: SizedBox(
                height: 120,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _OfferCopy(colors: colors)),
                    Transform.rotate(
                      angle: -0.28,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        color: colors.caramel,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '50%\n',
                                style: GoogleFonts.poppins(
                                  color: colors.primaryText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  height: 0.95,
                                ),
                              ),
                              TextSpan(
                                text: 'OFF',
                                style: GoogleFonts.poppins(
                                  color: colors.primaryText,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaleCircle extends StatelessWidget {
  const _PaleCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.28),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _OfferCopy extends StatelessWidget {
  const _OfferCopy({required this.colors});

  final CoffeeColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Special offer',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.75),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Save 50%',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' on your first order',
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.82),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: const [
            _OfferPill(label: 'New users'),
            _OfferPill(label: 'Today only'),
          ],
        ),
      ],
    );
  }
}

class _OfferPill extends StatelessWidget {
  const _OfferPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PopularHeader extends StatelessWidget {
  const PopularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    return Row(
      children: [
        Text(
          'Popular',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colors.primaryText,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),
        const Spacer(),
        Text(
          'See all',
          style: GoogleFonts.poppins(
            color: colors.brandBrown,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class DrinkGrid extends StatelessWidget {
  const DrinkGrid({super.key});

  static const drinks = [
    DrinkData('Cappuccino', 'Creamy and rich', '18.00', Icons.local_cafe),
    DrinkData('Caramel Latte', 'Sweet and smooth', '22.00', Icons.coffee),
    DrinkData('Green Tea', 'Light and herbal', '15.00', Icons.eco),
    DrinkData('Orange Juice', 'Freshly squeezed', '20.00', Icons.local_drink),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: drinks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) => DrinkCard(drink: drinks[index]),
    );
  }
}

class DrinkData {
  const DrinkData(this.name, this.subtitle, this.price, this.icon);

  final String name;
  final String subtitle;
  final String price;
  final IconData icon;
}

class DrinkCard extends StatelessWidget {
  const DrinkCard({required this.drink, super.key});

  final DrinkData drink;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.chipBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(drink.icon, color: colors.brandBrown, size: 36),
          ),
          const SizedBox(height: 10),
          Text(
            drink.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: colors.primaryText,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            drink.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: colors.secondaryText,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            '${drink.price} EGP',
            style: GoogleFonts.poppins(
              color: colors.brandBrown,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeBottomBar extends StatelessWidget {
  const CoffeeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoffeeColors>()!;
    return SizedBox(
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home_rounded, color: colors.brandBrown),
          Icon(Icons.favorite_border, color: colors.secondaryText),
          Icon(Icons.receipt_long_outlined, color: colors.secondaryText),
          Icon(Icons.person_outline, color: colors.secondaryText),
        ],
      ),
    );
  }
}
