# Areisto Week 3 — Clean It Up

## Run the project

```bash
cd coffee_menu
flutter pub get
flutter analyze
flutter run
```

## Refactor summary

- Split the old combined widget file into one main widget class per file.
- Added `DrinkData` in `lib/models/drink_data.dart`.
- Made `DrinkCard` data-driven instead of hard-coding drink names and prices.
- Built the grid from a `List<DrinkData>`.
- Added two drinks: Mocha and Blueberry Muffin.
- Added the `Pastries` category chip.
- Added a sold-out Green Tea card with a grey image area and no plus button.
- Kept colors and text styles in the app theme.

## Diff stat

Run this command from the repository root immediately before submitting:

```bash
git diff --stat main
```

Paste the real output below. Do not invent the numbers:

```text
[Paste the output of git diff --stat main here]
```

## Rules and exceptions

No clean-code limit was intentionally crossed. Each main widget is in its own file, each file is below 200 lines, and the build methods are short. `DrinkData` is a model rather than a widget, so it is kept in the models folder.

## What I would still change

I would replace the placeholder Material icons with real coffee images while keeping the same data-driven card. I would also make category selection and the plus button interactive in a later week, because this week's task is focused on refactoring rather than adding new behavior.

## Before and after

`before.png` and `after.png` are included as the required comparison screenshots. The refactor keeps the Week 2 layout while the Part C additions demonstrate that the new structure can be extended.
