import 'dart:io';

void main(List<String> args) {
  final input = File('assets/input.txt').readAsStringSync();
  if (args.contains('--distance')) {
    final result = calculateDistance(input);
    print('result: $result');
  }
  if (args.contains('--similarity')) {
    final result = calculateSimilarity(input);
    print('result: $result');
  }
}

int calculateSimilarity(String input) {
  if (input.isEmpty) return 0;
  final lines = input.split('\n');
  final (a, b, counts) = _getArraysWithCounts(lines);
  assert(a.length == b.length, "length must match");
  int total = 0;
  for (var i = 0; i < a.length; i++) {
    final a1 = a[i];
    final count = counts[a1] ?? 0;
    total += (a1 * count);
  }
  return total;
}

int calculateDistance(String input) {
  if (input.isEmpty) return 0;
  final lines = input.split('\n');
  final (a, b) = _getArrays(lines);
  a.sort();
  b.sort();
  assert(a.length == b.length, "length must match");
  int total = 0;
  for (var i = 0; i < a.length; i++) {
    final a1 = a[i];
    final b1 = b[i];
    total += (a1 - b1).abs();
  }
  return total;
}

(int, int) _getPair(String str) {
  final [a, b] = str.split('   ').map(int.parse).toList();
  return (a, b);
}

(List<int>, List<int>) _getArrays(List<String> lines) {
  final a = <int>[], b = <int>[];
  for (final line in lines) {
    if (line.trim().isEmpty) break;
    final pair = _getPair(line);
    a.add(pair.$1);
    b.add(pair.$2);
  }
  return (a, b);
}

(List<int>, List<int>, Map<int, int> counts) _getArraysWithCounts(
    List<String> lines) {
  final a = <int>[], b = <int>[];
  final counts = <int, int>{};
  for (final line in lines) {
    if (line.trim().isEmpty) break;
    final pair = _getPair(line);
    a.add(pair.$1);
    b.add(pair.$2);
    final current = counts.putIfAbsent(pair.$2, () => 0);
    counts[pair.$2] = current + 1;
  }
  return (a, b, counts);
}
