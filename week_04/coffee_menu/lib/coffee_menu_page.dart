import 'package:flutter/material.dart';
import 'models/drink_data.dart';
import 'models/order.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/category_chips.dart';
import 'widgets/drink_grid.dart';
import 'widgets/greeting_row.dart';
import 'widgets/offer_card.dart';
import 'widgets/popular_header.dart';
import 'widgets/search_field.dart';

class CoffeeMenuPage extends StatefulWidget {
  const CoffeeMenuPage({super.key});

  @override
  State<CoffeeMenuPage> createState() => _CoffeeMenuPageState();
}

class _CoffeeMenuPageState extends State<CoffeeMenuPage> {
  final Order order = Order(customerName: 'Sara');
  String selectedCategory = 'All';

  static const allDrinks = [
    DrinkData(name: 'Cappuccino', subtitle: 'Creamy and rich', price: 18, icon: Icons.local_cafe, category: 'Coffee'),
    DrinkData(name: 'Caramel Latte', subtitle: 'Sweet and smooth', price: 22, icon: Icons.coffee, category: 'Coffee'),
    DrinkData(name: 'Green Tea', subtitle: 'Light and herbal', price: 15, icon: Icons.eco, category: 'Tea', soldOut: true),
    DrinkData(name: 'Orange Juice', subtitle: 'Freshly squeezed', price: 20, icon: Icons.local_drink, category: 'Juice'),
    DrinkData(name: 'Mocha', subtitle: 'Chocolate and bold', price: 24, icon: Icons.coffee_outlined, category: 'Coffee'),
    DrinkData(name: 'Blueberry Muffin', subtitle: 'Soft and sweet', price: 16, icon: Icons.bakery_dining, category: 'Pastries'),
  ];

  List<DrinkData> get filteredDrinks => selectedCategory == 'All'
      ? allDrinks
      : allDrinks.where((drink) => drink.category == selectedCategory).toList();

  void selectCategory(String category) {
    setState(() => selectedCategory = category);
  }

  void addDrink(DrinkData drink) {
    if (drink.soldOut) return;
    setState(() => order.addDrink(drink));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingRow(),
              const SizedBox(height: 20),
              const SearchField(),
              const SizedBox(height: 20),
              CategoryChips(selectedCategory: selectedCategory, onCategorySelected: selectCategory),
              const SizedBox(height: 24),
              const OfferCard(),
              const SizedBox(height: 24),
              const PopularHeader(),
              const SizedBox(height: 12),
              DrinkGrid(drinks: filteredDrinks, onAdd: addDrink),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(order: order),
    );
  }
}
