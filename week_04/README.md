# Areisto Week 4 — Make It Work

## Run the project

```bash
cd coffee_menu
flutter pub get
flutter analyze
flutter run
```

## Included behavior

- Category chips select one category and filter the drink grid.
- `All` shows every drink.
- `Desserts` intentionally has no drinks to demonstrate the empty state.
- The plus button adds an available drink to the order.
- The sold-out drink has a disabled plus button and cannot be added.
- The bottom bar displays `No items yet` or the current item count and total.
- The order uses the reusable logic from Week 1.

## State ownership

`_CoffeeMenuPageState` owns both `selectedCategory` and `order` because it is the nearest common ancestor of the category chips, drink cards, and bottom bar. Child widgets receive values and callbacks. The implementation uses `StatefulWidget` and `setState` only; no state-management package is used.

## Clean code notes

Each main widget remains in its own file. The state page contains the screen-level state and callbacks. The `allDrinks` list is kept in the page because it is screen data for this assignment; in a larger project it could move to a separate data source.

## What I would still change

I would add item removal and quantity controls in a later assignment. I would also use a shared state solution for a second cart screen, but that is intentionally outside this week's rules.

## Required screenshots

Place three screenshots in `screens/` before submitting:

- `empty_order.png` — initial screen showing `No items yet`.
- `filtered.png` — a selected category with its filtered drinks.
- `order_with_items.png` — the bottom bar after adding drinks.
