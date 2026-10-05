import 'drink_data.dart';

class OrderItem {
  const OrderItem({required this.name, required this.price});

  final String name;
  final double price;
}

class Order {
  Order({required this.customerName});

  final String customerName;
  final List<OrderItem> drinks = [];

  void addDrink(DrinkData drink) {
    drinks.add(OrderItem(name: drink.name, price: drink.price));
  }

  int get itemCount => drinks.length;

  double get total => drinks.fold(0, (sum, drink) => sum + drink.price);
}
