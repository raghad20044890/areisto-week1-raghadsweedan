# Part B — Explain It in My Own Words

## 1. `final` vs `const`

`final` means that a variable can be assigned only once, but its value may be created at runtime. `const` means that the value is a compile-time constant, so Dart must know the complete value before the program runs. For example:

```dart
final createdAt = DateTime.now();
// const createdAt = DateTime.now(); // Error: not a compile-time constant
```

`final` works because the current date is calculated while the program is running. `const` fails because `DateTime.now()` does not produce a value that the compiler can know in advance. Both prevent reassignment after initialization, but `const` is stricter and is also used for constant object values.

## 2. Null safety

Null safety prevents a program from treating a missing value as if it definitely exists. For example, if `String? username` is null, calling `username.length` can crash at runtime. Dart makes me check the value first:

```dart
if (username != null) {
  print(username.length);
}
```

The `!` operator tells Dart that I guarantee the value is not null. It is acceptable when that fact is guaranteed by an earlier check or by the design of the program, but it should be rare because a wrong guarantee causes a runtime exception. Prefer a null check, `?.`, `??`, or a required non-null parameter when those options express the logic more safely.

## 3. Modeling

I would create these three classes:

```text
Student: id, name, enrolledCourses; enrollInCourse()
Course: code, title, capacity; hasAvailableSeat()
Registration: student, course, registeredAt; cancel()
```

`Student` represents a person who can enroll in courses. `Course` represents a course and contains rules about its capacity. `Registration` represents the relationship between one student and one course, including when the registration happened. I would make `Registration` a class instead of using a map because it has a clear identity and behavior. A class also gives the fields meaningful types and keeps related operations, such as cancellation, next to the data they change. This makes the model easier to validate and extend.

