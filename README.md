# Areisto Week 1 Solution

## How to run it

Install Dart, then run the tests:

```bash
dart pub get
dart test
```

To run the coffee shop example:

```bash
dart run coffee_shop.dart
```

## Decisions

1. I made `Drink` abstract because every drink shares common data and pricing behavior, but each drink type must provide its own description.
2. I kept the drink list inside `Order` because adding, removing, counting, and totaling drinks are responsibilities of an order.
3. I applied the size multiplier after adding coffee shot costs, so the final price reflects the complete drink before the size adjustment.

## Struggles

The hardest part was deciding how to combine inheritance with different pricing and description rules. I solved it by keeping shared behavior in `Drink`, overriding the coffee price because shots affect it, and overriding `description()` in every subclass. I also had to pay attention to nullable values and whitespace when implementing the warm-up functions.
