import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EventState', () {
    test('has correct values', () {
      expect(EventState.values.length, 4);
      expect(EventState.values, contains(EventState.initial));
      expect(EventState.values, contains(EventState.loading));
      expect(EventState.values, contains(EventState.data));
      expect(EventState.values, contains(EventState.error));
    });
  });

  group('EventStateX', () {
    test('isInitial', () {
      expect(EventState.initial.isInitial, isTrue);
      expect(EventState.loading.isInitial, isFalse);
    });

    test('isLoading', () {
      expect(EventState.loading.isLoading, isTrue);
      expect(EventState.data.isLoading, isFalse);
    });

    test('isData', () {
      expect(EventState.data.isData, isTrue);
      expect(EventState.error.isData, isFalse);
    });

    test('isError', () {
      expect(EventState.error.isError, isTrue);
      expect(EventState.initial.isError, isFalse);
    });
  });
}
