import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PaginationState', () {
    test('default values', () {
      final state = PaginationState<int>();
      expect(state.items, isEmpty);
      expect(state.eventState, EventState.initial);
      expect(state.errorMessage, isNull);
      expect(state.hasMore, isTrue);
    });

    test('isInitial', () {
      expect(PaginationState<int>().isInitial, isTrue);
    });

    test('isLoading', () {
      final state = PaginationState<int>(eventState: EventState.loading);
      expect(state.isLoading, isTrue);
      expect(state.isInitial, isFalse);
    });

    test('isData', () {
      final state = PaginationState<int>(eventState: EventState.data);
      expect(state.isData, isTrue);
    });

    test('isError', () {
      final state = PaginationState<int>(eventState: EventState.error);
      expect(state.isError, isTrue);
    });

    test('isEmpty when items list is empty', () {
      expect(PaginationState<int>().isEmpty, isTrue);
      expect(PaginationState<int>(items: [1, 2]).isEmpty, isFalse);
    });

    group('copyWith', () {
      test('copies with new items', () {
        final state = PaginationState<int>(items: [1, 2, 3]);
        final copied = state.copyWith(items: [4, 5]);
        expect(copied.items, [4, 5]);
        expect(copied.eventState, state.eventState);
      });

      test('copies with new eventState', () {
        final state = PaginationState<int>();
        final copied = state.copyWith(eventState: EventState.loading);
        expect(copied.eventState, EventState.loading);
        expect(copied.items, state.items);
      });

      test('copies with new errorMessage', () {
        final state = PaginationState<int>();
        final copied = state.copyWith(errorMessage: 'Network error');
        expect(copied.errorMessage, 'Network error');
      });

      test('copies with hasMore false', () {
        final state = PaginationState<int>();
        final copied = state.copyWith(hasMore: false);
        expect(copied.hasMore, isFalse);
      });

      test('keeps original values when not specified', () {
        final state = PaginationState<int>(
          items: [1, 2],
          eventState: EventState.data,
          errorMessage: 'err',
          hasMore: false,
        );
        final copied = state.copyWith();
        expect(copied.items, [1, 2]);
        expect(copied.eventState, EventState.data);
        expect(copied.errorMessage, 'err');
        expect(copied.hasMore, isFalse);
      });
    });

    group('equality', () {
      test('equal states', () {
        final a = PaginationState<int>(
          items: [1, 2],
          eventState: EventState.data,
        );
        final b = PaginationState<int>(
          items: [1, 2],
          eventState: EventState.data,
        );
        expect(a, equals(b));
        expect(a.hashCode, equals(b.hashCode));
      });

      test('different items are not equal', () {
        final a = PaginationState<int>(items: [1, 2]);
        final b = PaginationState<int>(items: [3, 4]);
        expect(a, isNot(equals(b)));
      });

      test('different eventState are not equal', () {
        final a = PaginationState<int>(eventState: EventState.initial);
        final b = PaginationState<int>(eventState: EventState.loading);
        expect(a, isNot(equals(b)));
      });

      test('identical returns true', () {
        final a = PaginationState<int>();
        expect(a == a, isTrue);
      });
    });

    test('toString contains state info', () {
      final state = PaginationState<int>(
        items: [1],
        eventState: EventState.data,
        hasMore: false,
      );
      final str = state.toString();
      expect(str, contains('PaginationState'));
      expect(str, contains('EventState.data'));
      expect(str, contains('hasMore: false'));
    });
  });
}
