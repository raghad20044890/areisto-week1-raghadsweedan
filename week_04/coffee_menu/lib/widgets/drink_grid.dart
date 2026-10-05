import 'package:flutter/material.dart';
import '../models/drink_data.dart';
import 'drink_card.dart';

class DrinkGrid extends StatelessWidget {
  const DrinkGrid({required this.drinks, required this.onAdd, super.key});

  final List<DrinkData> drinks;
  final ValueChanged<DrinkData> onAdd;

  @override
  Widget build(BuildContext context) {
    if (drinks.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Center(child: Text('No drinks in this category')),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: drinks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final drink = drinks[index];
        return DrinkCard(drink: drink, onAdd: () => onAdd(drink));
      },
    );
  }
}
