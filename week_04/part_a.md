# Part A — Three Questions

## 1. StatelessWidget or StatefulWidget

A widget should be a `StatelessWidget` when its output depends only on constructor values and inherited theme data, and it does not change during its lifetime. It should be a `StatefulWidget` when it owns or reacts to data that can change while the screen is open. `OfferCard` remains stateless in this week's screen because its text and appearance do not change after a user taps the screen. The page itself is stateful because it owns the selected category and the current order.

## 2. What setState does

`setState` tells Flutter that the state object has changed and that the widget subtree should be rebuilt. If a variable changes inside `State` without calling `setState`, the variable really does change in memory, but Flutter is not notified. Therefore, the current screen does not update immediately. The change must be made inside the callback passed to `setState`.

## 3. Where the order belongs

The order belongs in the nearest common ancestor of `DrinkCard` and the bottom bar, which is `_CoffeeMenuPageState`. The page owns the `Order` object and passes an `onAdd` callback down to each card, while it passes the order value down to the bottom bar. The order cannot live inside `DrinkCard` because the bottom bar is not a child of the card and could not read that private state. Keeping it at the page level also gives both widgets one shared source of truth.
