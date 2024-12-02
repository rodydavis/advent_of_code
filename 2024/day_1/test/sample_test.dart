import 'package:day_1/main.dart';
import 'package:test/test.dart';

final testData = '''
3   4
4   3
2   5
1   3
3   9
3   3
''';

void main() {
  group("day 1", () {
    group('part 1', () {
      test('check for empty input', () {
        final result = calculateDistance("");
        expect(result, 0);
      });

      test('sample should return 11', () {
        final result = calculateDistance(testData);
        expect(result, 11);
      });
    });

    group('part 2', () {
      test('check for empty input', () {
        final result = calculateSimilarity("");
        expect(result, 0);
      });

      test('sample should return 31', () {
        final result = calculateSimilarity(testData);
        expect(result, 31);
      });
    });
  });
}
