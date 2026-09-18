enum DrinkSize {
  small,
  medium,
  large,
}

abstract class Drink {
  Drink({
    required this.name,
    required this.basePrice,
    required this.size,
  });

  final String name;
  final double basePrice;
  final DrinkSize size;

  double get sizeMultiplier {
    switch (size) {
      case DrinkSize.small:
        return 1.0;
      case DrinkSize.medium:
        return 1.25;
      case DrinkSize.large:
        return 1.5;
    }
  }

  double get finalPrice => basePrice * sizeMultiplier;

  String description();

  @override
  String toString() => description();
}

class Coffee extends Drink {
  Coffee({
    required super.name,
    required super.basePrice,
    required super.size,
    required this.extraShots,
  });

  final int extraShots;

  @override
  double get finalPrice => (basePrice + extraShots * 5) * sizeMultiplier;

  @override
  String description() {
    final shotLabel = extraShots == 1 ? 'extra shot' : 'extra shots';
    return '$name (${size.name}, $extraShots $shotLabel)';
  }
}

class Tea extends Drink {
  Tea({
    required super.name,
    required super.basePrice,
    required super.size,
    required this.isHerbal,
  });

  final bool isHerbal;

  @override
  String description() {
    final herbalLabel = isHerbal ? 'herbal' : 'regular';
    return '$name (${size.name}, $herbalLabel)';
  }
}

class Juice extends Drink {
  Juice({
    required super.name,
    required super.basePrice,
    required super.size,
    required this.fruitName,
  });

  final String fruitName;

  @override
  String description() => '$name (${size.name}, $fruitName)';
}

class Order {
  Order({required this.customerName});

  final String customerName;
  final List<Drink> drinks = [];

  void addDrink(Drink drink) {
    drinks.add(drink);
  }

  bool removeDrink(Drink drink) {
    return drinks.remove(drink);
  }

  int get itemCount => drinks.length;

  double get totalPrice {
    return drinks.fold(0, (total, drink) => total + drink.finalPrice);
  }

  String receipt() {
    final buffer = StringBuffer()
      ..writeln('=== Areisto Coffee ===')
      ..writeln()
      ..writeln('Customer: $customerName')
      ..writeln();

    for (final drink in drinks) {
      buffer.writeln(
        '${drink.description().padRight(35)} '
        '${drink.finalPrice.toStringAsFixed(2)} EGP',
      );
      buffer.writeln();
    }

    buffer
      ..writeln('Items: $itemCount')
      ..writeln()
      ..writeln('Total: ${totalPrice.toStringAsFixed(2)} EGP');

    return buffer.toString();
  }
}

void main() {
  final order = Order(customerName: 'Sara');

  final latte = Coffee(
    name: 'Latte',
    basePrice: 20,
    size: DrinkSize.large,
    extraShots: 2,
  );
  final greenTea = Tea(
    name: 'Green Tea',
    basePrice: 15,
    size: DrinkSize.small,
    isHerbal: true,
  );
  final orangeJuice = Juice(
    name: 'Orange Juice',
    basePrice: 20,
    size: DrinkSize.medium,
    fruitName: 'orange',
  );
  final lemonade = Juice(
    name: 'Lemonade',
    basePrice: 12,
    size: DrinkSize.small,
    fruitName: 'lemon',
  );

  order
    ..addDrink(latte)
    ..addDrink(greenTea)
    ..addDrink(orangeJuice)
    ..addDrink(lemonade)
    ..removeDrink(lemonade);

  print(order.receipt());
