# Part A — Two Ideas, Three Questions

## 1. Single Responsibility

Single Responsibility means that a class or widget should have one clear job and one main reason to change. In the Week 2 code, `coffee_widgets.dart` had more than one reason to change because it contained the greeting, search field, category chips, offer card, drink grid, drink card, and bottom bar. A change to the offer design and a change to the drink-card layout were unrelated reasons to edit the same file. In Week 3, each widget has its own file and responsibility.

## 2. Open / Closed

Open for extension and closed for modification means that stable code should accept new data or behavior without being rewritten every time. In this coffee app, adding Mocha or a Blueberry Muffin only requires adding a new `DrinkData` item to the list. `DrinkCard` does not need to be copied or rewritten for every drink, so it is open to new drink data and closed to repeated layout changes.

## 3. Constraints go down. Sizes go up. Parent sets position.

A parent widget gives its child the amount of space the child is allowed to use. The child chooses a size within those limits, and the parent decides where the child is placed. For example, the grid gives each `DrinkCard` a bounded cell, the card lays out its image and text inside that cell, and the grid decides which row and column contain the card. The card does not choose its final position by itself.
