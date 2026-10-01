# Part A — Three Questions from Last Week

## 1. What does `late` do?

`late` tells Dart that a non-nullable variable will be initialized later, before it is read. It is useful when the value cannot be created in the constructor or declaration, but another method will definitely initialize it first. If the variable is read before initialization, Dart throws a `LateInitializationError`, so using `late` carelessly moves a safety check from compile time to runtime.

## 2. `String` vs `String?`

`String` is non-nullable, so it must always contain a string and I can call string methods on it without an extra null check. `String?` may contain a string or `null`, so Dart makes me check it, use `?.`, provide a fallback with `??`, or prove it is non-null before using it. The nullable version is safer when a value can genuinely be missing, but it needs extra handling.

## 3. What is a getter?

A getter looks like a field when I read it, but its value is calculated by code. In my coffee shop code, `Order` has this getter:

```dart
double get totalPrice {
  return drinks.fold(0, (total, drink) => total + drink.finalPrice);
}
```

A getter is better than storing the total because the total always comes from the current list of drinks. It is better than a normal method because reading `order.totalPrice` describes a property of the order and does not need an action-style name such as `calculateTotal()`.
