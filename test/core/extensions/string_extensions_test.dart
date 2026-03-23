import 'package:flutter_common_utils/src/core/extensions/string_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringX', () {
    group('nullIfEmptyOrWhiteSpace', () {
      test('returns null for empty string', () {
        expect(''.nullIfEmptyOrWhiteSpace, isNull);
      });

      test('returns null for whitespace-only string', () {
        expect('   '.nullIfEmptyOrWhiteSpace, isNull);
      });

      test('returns trimmed value for non-empty string', () {
        expect('hello'.nullIfEmptyOrWhiteSpace, 'hello');
      });

      test('returns trimmed value for string with surrounding spaces', () {
        expect('  hello  '.nullIfEmptyOrWhiteSpace, 'hello');
      });
    });

    group('commasToDots', () {
      test('replaces commas with dots', () {
        expect('1,5'.commasToDots, '1.5');
      });

      test('replaces multiple commas', () {
        expect('1,000,50'.commasToDots, '1.000.50');
      });

      test('no change when no commas', () {
        expect('hello'.commasToDots, 'hello');
      });
    });

    group('toNewLines', () {
      test('replaces spaces with newlines', () {
        expect('a b c'.toNewLines, 'a\nb\nc');
      });
    });

    group('capitalizeFirst', () {
      test('capitalizes first letter', () {
        expect('hello'.capitalizeFirst, 'Hello');
      });

      test('already capitalized stays same', () {
        expect('Hello'.capitalizeFirst, 'Hello');
      });

      test('single character', () {
        expect('h'.capitalizeFirst, 'H');
      });
    });

    group('formatNumberWithSpaces', () {
      test('formats number with spaces', () {
        expect('1000'.formatNumberWithSpaces, '1 000');
      });

      test('formats large number', () {
        expect('1000000'.formatNumberWithSpaces, '1 000 000');
      });

      test('handles decimal part', () {
        expect('1000.50'.formatNumberWithSpaces, '1 000.50');
      });

      test('empty string returns empty', () {
        expect(''.formatNumberWithSpaces, '');
      });

      test('small number unchanged', () {
        expect('100'.formatNumberWithSpaces, '100');
      });

      test('handles single digit', () {
        expect('5'.formatNumberWithSpaces, '5');
      });
    });
  });

  group('StringXNullable', () {
    group('isNullOrEmpty', () {
      test('null returns true', () {
        const String? value = null;
        expect(value.isNullOrEmpty, isTrue);
      });

      test('empty string returns true', () {
        const String? value = '';
        expect(value.isNullOrEmpty, isTrue);
      });

      test('whitespace-only returns true', () {
        const String? value = '   ';
        expect(value.isNullOrEmpty, isTrue);
      });

      test('non-empty returns false', () {
        const String? value = 'hello';
        expect(value.isNullOrEmpty, isFalse);
      });
    });
  });
}
