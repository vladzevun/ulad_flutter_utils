import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SingleRequestState', () {
    test('default values', () {
      final state = SingleRequestState<String>();
      expect(state.data, isNull);
      expect(state.eventState, EventState.initial);
      expect(state.errorMessage, isNull);
      expect(state.hasMore, isTrue);
    });

    test('isInitial', () {
      expect(SingleRequestState<String>().isInitial, isTrue);
    });

    test('isLoading', () {
      final state = SingleRequestState<String>(eventState: EventState.loading);
      expect(state.isLoading, isTrue);
    });

    test('isData', () {
      final state = SingleRequestState<String>(eventState: EventState.data);
      expect(state.isData, isTrue);
    });

    test('isError', () {
      final state = SingleRequestState<String>(eventState: EventState.error);
      expect(state.isError, isTrue);
    });

    test('isEmpty when data is null', () {
      expect(SingleRequestState<String>().isEmpty, isTrue);
      expect(SingleRequestState<String>(data: 'hello').isEmpty, isFalse);
    });

    group('copyWith', () {
      test('copies with new data', () {
        final state = SingleRequestState<String>(data: 'old');
        final copied = state.copyWith(data: 'new');
        expect(copied.data, 'new');
      });

      test('copies with new eventState', () {
        final state = SingleRequestState<String>();
        final copied = state.copyWith(eventState: EventState.error);
        expect(copied.eventState, EventState.error);
      });

      test('copies with new errorMessage', () {
        final state = SingleRequestState<String>();
        final copied = state.copyWith(errorMessage: 'fail');
        expect(copied.errorMessage, 'fail');
      });

      test('keeps original values when not specified', () {
        final state = SingleRequestState<String>(
          data: 'hello',
          eventState: EventState.data,
          errorMessage: 'err',
          hasMore: false,
        );
        final copied = state.copyWith();
        expect(copied.data, 'hello');
        expect(copied.eventState, EventState.data);
        expect(copied.errorMessage, 'err');
        expect(copied.hasMore, isFalse);
      });
    });

    group('equality', () {
      test('equal states', () {
        final a = SingleRequestState<String>(
          data: 'x',
          eventState: EventState.data,
        );
        final b = SingleRequestState<String>(
          data: 'x',
          eventState: EventState.data,
        );
        expect(a, equals(b));
        expect(a.hashCode, equals(b.hashCode));
      });

      test('different data are not equal', () {
        final a = SingleRequestState<String>(data: 'x');
        final b = SingleRequestState<String>(data: 'y');
        expect(a, isNot(equals(b)));
      });

      test('identical returns true', () {
        final a = SingleRequestState<String>();
        expect(a == a, isTrue);
      });
    });

    test('toString contains state info', () {
      final state = SingleRequestState<String>(
        data: 'test',
        eventState: EventState.data,
      );
      final str = state.toString();
      expect(str, contains('SingleRequestState'));
      expect(str, contains('test'));
    });
  });
}
