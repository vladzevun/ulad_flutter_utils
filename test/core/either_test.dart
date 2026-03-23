import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Either', () {
    group('createLeft', () {
      test('creates a left value', () {
        final either = Either.createLeft<String, int>('error');
        expect(either.isLeft(), isTrue);
        expect(either.isRight(), isFalse);
        expect(either.left, 'error');
      });

      test('throws on accessing right', () {
        final either = Either.createLeft<String, int>('error');
        expect(() => either.right, throwsStateError);
      });
    });

    group('createRight', () {
      test('creates a right value', () {
        final either = Either.createRight<String, int>(42);
        expect(either.isRight(), isTrue);
        expect(either.isLeft(), isFalse);
        expect(either.right, 42);
      });

      test('throws on accessing left', () {
        final either = Either.createRight<String, int>(42);
        expect(() => either.left, throwsStateError);
      });
    });

    group('fold', () {
      test('calls onLeft for left value', () {
        final either = Either.createLeft<String, int>('error');
        final result = either.fold((l) => 'Left: $l', (r) => 'Right: $r');
        expect(result, 'Left: error');
      });

      test('calls onRight for right value', () {
        final either = Either.createRight<String, int>(42);
        final result = either.fold((l) => 'Left: $l', (r) => 'Right: $r');
        expect(result, 'Right: 42');
      });
    });

    group('when', () {
      test('calls left callback for left value', () {
        final either = Either.createLeft<String, int>('error');
        String? leftResult;
        int? rightResult;

        either.when(left: (l) => leftResult = l, right: (r) => rightResult = r);

        expect(leftResult, 'error');
        expect(rightResult, isNull);
      });

      test('calls right callback for right value', () {
        final either = Either.createRight<String, int>(42);
        String? leftResult;
        int? rightResult;

        either.when(left: (l) => leftResult = l, right: (r) => rightResult = r);

        expect(leftResult, isNull);
        expect(rightResult, 42);
      });
    });

    group('getOrElse', () {
      test('returns right value when right', () {
        final either = Either.createRight<String, int>(42);
        expect(either.getOrElse(() => 0), 42);
      });

      test('returns default when left', () {
        final either = Either.createLeft<String, int>('error');
        expect(either.getOrElse(() => 0), 0);
      });
    });

    group('map', () {
      test('transforms right value', () {
        final either = Either.createRight<String, int>(21);
        final mapped = either.map((r) => r * 2);
        expect(mapped.right, 42);
      });

      test('preserves left value', () {
        final either = Either.createLeft<String, int>('error');
        final mapped = either.map((r) => r * 2);
        expect(mapped.left, 'error');
      });
    });

    group('leftMap', () {
      test('transforms left value', () {
        final either = Either.createLeft<String, int>('error');
        final mapped = either.leftMap((l) => l.toUpperCase());
        expect(mapped.left, 'ERROR');
      });

      test('preserves right value', () {
        final either = Either.createRight<String, int>(42);
        final mapped = either.leftMap((l) => l.toUpperCase());
        expect(mapped.right, 42);
      });
    });

    group('top-level helpers', () {
      test('left() creates left Either', () {
        final either = left<String, int>('error');
        expect(either.isLeft(), isTrue);
        expect(either.left, 'error');
      });

      test('right() creates right Either', () {
        final either = right<String, int>(42);
        expect(either.isRight(), isTrue);
        expect(either.right, 42);
      });
    });
  });
}
