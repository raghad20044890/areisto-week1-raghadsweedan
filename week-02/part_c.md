# Part C — Explain Your Tree

## 1. Where did I split my widgets, and why?

I split the screen into a scaffold shell, a greeting row, a search bar, category chips, an offer card, a popular section, drink cards, and a bottom bar. I made each part responsible for one visible area instead of putting the whole screen into one build method. For example, `OfferCard` is extracted because it contains a clipped stack, positioned circles, a rotated badge, rich text, and a wrapping row of pills. If it stayed inline in the main build method, the main method would become difficult to read and any change to the offer design could affect unrelated parts of the screen. Separate widgets also make the layout easier to inspect when a constraint or overflow error appears.

## 2. Expanded, Flexible, and SizedBox

`Expanded` forces a child of a Flex widget such as `Row` or `Column` to take the remaining available space. In this submission, the search field is inside an `Expanded` so the filter icon can keep its fixed width while the field fills the rest of the row. `Flexible` also lets a child use available Flex space, but it does not force the child to fill all of it; I would use it for text that may take less room beside another widget. `SizedBox` gives a fixed width or height, or simply creates space. I use it for section gaps and the fixed search-bar height. These widgets solve different constraint problems, so replacing them blindly can cause overflow or unwanted stretching.

## 3. A layout problem that took time

The problem that took the most time was making the offer card keep its decorative circles and pill row inside the rounded card on a narrow screen. At first I put the circles in a normal `Row`, which made them affect the card's layout and pushed the content wider than the screen. I also tried fixed positions without clipping, so the circles painted outside the rounded surface. The actual cause was mixing decorative elements with layout elements and forgetting that a Stack still needs a bounded parent. I fixed it by putting the card contents in a `ClipRRect`, using a bounded `SizedBox` for the card, placing the circles with `Positioned`, and putting the pills in `Wrap`. The card now clips decoration and lets the pills move to another line instead of overflowing.
