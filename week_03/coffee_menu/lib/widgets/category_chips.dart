import 'package:flutter/material.dart';

import 'category_chip.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = ['All', 'Coffee', 'Tea', 'Juice', 'Pastries'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var index = 0; index < categories.length; index++) ...[
            CategoryChip(label: categories[index], selected: index == 0),
            if (index < categories.length - 1) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}
