import 'package:flutter_common_utils/src/core/extensions/date_format_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('DateFormatX', () {
    group('tryFormat', () {
      test('returns null for null date', () {
        final formatter = DateFormat('yyyy-MM-dd');
        expect(formatter.tryFormat(null), isNull);
      });

      test('formats valid date', () {
        final formatter = DateFormat('yyyy-MM-dd');
        final date = DateTime(2024, 3, 15);
        expect(formatter.tryFormat(date), '2024-03-15');
      });
    });
  });

  group('DateTimeX', () {
    test('toHHmmddMMyyyyDoted', () {
      final date = DateTime(2024, 3, 15, 14, 30);
      expect(date.toHHmmddMMyyyyDoted(), '14:30 15.03.2024');
    });

    test('toddMMyyyyDoted', () {
      final date = DateTime(2024, 3, 15);
      expect(date.toddMMyyyyDoted(), '15.03.2024');
    });

    test('toddMMyyyyHHmmDoted', () {
      final date = DateTime(2024, 3, 15, 14, 30);
      expect(date.toddMMyyyyHHmmDoted(), '15.03.2024 14:30');
    });

    test('toddMMyyyyString with separator', () {
      final date = DateTime(2024, 3, 15);
      expect(date.toddMMyyyyString(separator: '/'), '15/03/2024');
      expect(date.toddMMyyyyString(separator: '-'), '15-03-2024');
    });

    test('formatDateTimeYear', () {
      final date = DateTime(2024, 3, 15);
      expect(date.formatDateTimeYear, '2024-03-15');
    });

    test('formatDateYear', () {
      final date = DateTime(2024, 3, 15);
      expect(date.formatDateYear, '2024');
    });

    test('toyyyyMMDDDashed', () {
      final date = DateTime(2024, 3, 15);
      expect(date.toyyyyMMDDDashed(), '2024-03-15');
    });

    test('toHourString', () {
      final date = DateTime(2024, 3, 15, 14, 30);
      expect(date.toHourString(separator: ':'), '14:30');
      expect(date.toHourString(separator: '.'), '14.30');
    });
  });

  group('formatDate', () {
    test('formats valid date string', () {
      expect(formatDate('2024-03-15'), '15-03-2024');
    });

    test('returns empty string for empty input', () {
      expect(formatDate(''), '');
    });

    test('returns empty string for space', () {
      expect(formatDate(' '), '');
    });
  });
}
