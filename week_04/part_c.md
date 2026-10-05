# Part C — Where the Pain Is

The widget tree is `CoffeeMenuPage` → `CategoryChips` and `DrinkGrid` → `DrinkCard`, while `BottomBar` is another child of `CoffeeMenuPage`. The selected category and the `Order` live in `_CoffeeMenuPageState`. The selected category is passed to `CategoryChips`, and its callback is passed back to the page. The filtered drinks and `onAdd` callback are passed to `DrinkGrid` and then to each `DrinkCard`; the order is passed to `BottomBar`.

1. The value is passed through one intermediate widget, `DrinkGrid`, before reaching `DrinkCard`. The callback also passes through `DrinkGrid` without changing it.

2. If a second cart screen used the same order, the order or a callback would have to be passed to that screen too. Because this week's rules do not allow navigation or a second screen, the order currently stays in the page that owns the menu. A larger app would need a shared state solution so both screens could read and update the same order without manually passing it through unrelated widgets.

3. The most annoying part was keeping the order in the page while the plus button was several levels lower in `DrinkCard`. The callback had to be passed through `DrinkGrid`, and the order had to be passed separately to `BottomBar`. This works, but every extra level makes the wiring more repetitive and makes the owner of the state less obvious.
