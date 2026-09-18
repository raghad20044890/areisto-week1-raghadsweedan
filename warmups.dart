String shout(String name) {
  final trimmed = name.trim();
  if (trimmed.isEmpty) {
    return 'Hello there!';
  }
  return 'Hello, ${trimmed.toUpperCase()}!';
}

int sumEven(List<int> numbers) {
  return numbers
      .where((number) => number.isEven)
      .fold(0, (sum, number) => sum + number);
}

Map<String, int> countWords(String sentence) {
  final trimmed = sentence.trim();
  if (trimmed.isEmpty) {
    return {};
  }

  final counts = <String, int>{};
  for (final word in trimmed.toLowerCase().split(RegExp(r'\s+'))) {
    counts[word] = (counts[word] ?? 0) + 1;
  }
  return counts;
}
