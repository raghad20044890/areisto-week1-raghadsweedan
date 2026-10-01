# Part C — Proving the Refactor Worked

I added Mocha and Blueberry Muffin by adding two entries to the `drinks` list. I added the `Pastries` category by adding one label to the category list. I added the sold-out behavior by adding a `soldOut` field to `DrinkData` and making `DrinkCard` use that field to show a grey image area, a `Sold out` subtitle, and no plus button. I did not create another card widget or rewrite the grid. Most of the work was additions to the data list and a small conditional inside the reusable card, which shows that the refactored structure is easier to extend.

Before submitting, I ran `git diff --stat main` and placed the real output in `README.md`. The exact numbers depend on the student's local Git history, so the placeholder in the README must be replaced with the output from the student's own repository.
