# Areisto — Week 2: Coffee Menu UI

## How to run it

Open `coffee_menu_ui` in IntelliJ or VS Code, run `flutter pub get`, and then run the app on an emulator or a real device:

```bash
cd coffee_menu_ui
flutter pub get
flutter run
```

Before submitting, run:

```bash
dart format .
```

## The five required widgets

- **`Stack` + `Positioned`:** `Stack` lets the decorative pieces sit on top of the card, while `Positioned` places each pale circle at an exact offset, including partly outside the card.
- **`ClipRRect`:** It clips the card's child to rounded corners, so the decorative circles stop at the card edge instead of spilling outside it.
- **`Transform.rotate`:** It turns the discount badge by a small angle; Flutter expects that angle in radians.
- **`Text.rich` with `TextSpan`:** It lets the `Save 50%` line use a large bold style and a smaller lighter style in the same text widget.
- **`Wrap`:** It lays the two offer pills in a row when there is room and moves one to the next line on a narrow screen instead of causing overflow.

## Decisions

1. I placed all reusable colors in a `CoffeeColors` theme extension and defined the main text theme with Poppins in `MaterialApp`. Widgets read these values through `Theme.of(context)` instead of repeating hex values.
2. I split the screen by visible responsibility: greeting, search, chips, offer, popular header, drink grid, drink card, and bottom bar. This keeps each build method short and makes layout problems easier to isolate.
3. I used `GridView.builder` with two columns and `shrinkWrap` inside the page's scroll view. The grid can therefore fit a phone width while the outer page handles vertical scrolling.

## Struggles

The hardest part was the offer card on a narrow screen. The circles are decorative and should not take layout space, while the pills still need to wrap. I solved it with a bounded `SizedBox`, `ClipRRect`, `Stack` and `Positioned` for the circles, and `Wrap` for the pills. I also had to use `NeverScrollableScrollPhysics` on the inner grid so the page has one clear vertical scroll area.

## Project location

The Flutter project for this branch is in:

```text
week-02/coffee_menu_ui/
```
