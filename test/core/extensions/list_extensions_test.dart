import 'package:flutter_common_utils/src/core/extensions/list_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListX', () {
    group('isFirst', () {
      test('returns true for first element', () {
        expect([1, 2, 3].isFirst(1), isTrue);
      });

      test('returns false for non-first element', () {
        expect([1, 2, 3].isFirst(2), isFalse);
      });

      test('returns false for element not in list', () {
        expect([1, 2, 3].isFirst(4), isFalse);
      });
    });

    group('isLast', () {
      test('returns true for last element', () {
        expect([1, 2, 3].isLast(3), isTrue);
      });

      test('returns false for non-last element', () {
        expect([1, 2, 3].isLast(1), isFalse);
      });

      test('returns false for element not in list', () {
        expect([1, 2, 3].isLast(4), isFalse);
      });
    });

    group('containsAtLeastOne', () {
      test('returns true when one element matches', () {
        expect([1, 2, 3].containsAtLeastOne([3, 4, 5]), isTrue);
      });

      test('returns true when multiple elements match', () {
        expect([1, 2, 3].containsAtLeastOne([2, 3]), isTrue);
      });

      test('returns false when no elements match', () {
        expect([1, 2, 3].containsAtLeastOne([4, 5, 6]), isFalse);
      });

      test('returns false for empty iterable', () {
        expect([1, 2, 3].containsAtLeastOne([]), isFalse);
      });
    });

    group('splitBy', () {
      test('splits list into chunks', () {
        final result = [1, 2, 3, 4, 5, 6].splitBy(2);
        expect(result, [
          [1, 2],
          [3, 4],
          [5, 6],
        ]);
      });

      test('handles remainder without filler', () {
        final result = [1, 2, 3, 4, 5].splitBy(2);
        expect(result, [
          [1, 2],
          [3, 4],
          [5],
        ]);
      });

      test('handles chunk size larger than list', () {
        final result = [1, 2].splitBy(5);
        expect(result, [
          [1, 2],
        ]);
      });

      test('handles empty list', () {
        final result = <int>[].splitBy(3);
        expect(result, isEmpty);
      });

      test('splits into single-item chunks', () {
        final result = [1, 2, 3].splitBy(1);
        expect(result, [
          [1],
          [2],
          [3],
        ]);
      });
    });
  });
}
