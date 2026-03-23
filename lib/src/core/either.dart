class Either<L, R> {
  final L? _left;
  final R? _right;

  const Either._(this._left, this._right);

  static Either<L, R> createLeft<L, R>(L l) => Either<L, R>._(l, null);

  static Either<L, R> createRight<L, R>(R r) => Either<L, R>._(null, r);

  bool isLeft() => _left != null;

  bool isRight() => _right != null;

  L get left {
    if (_left == null) {
      throw StateError('No Left value');
    }
    return _left;
  }

  R get right {
    if (_right == null) {
      throw StateError('No Right value');
    }
    return _right;
  }

  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    if (isLeft()) {
      return onLeft(_left as L);
    } else {
      return onRight(_right as R);
    }
  }

  void when({
    required void Function(L left) left,
    required void Function(R right) right,
  }) {
    if (isLeft()) {
      left(_left as L);
    } else if (isRight()) {
      right(_right as R);
    }
  }

  R getOrElse(R Function() defaultValue) {
    return isRight() ? _right! : defaultValue();
  }

  Either<T, R> leftMap<T>(T Function(L left) transform) {
    if (isLeft()) {
      return Either.createLeft(transform(_left as L));
    } else {
      return Either.createRight(_right as R);
    }
  }

  Either<L, T> map<T>(T Function(R right) transform) {
    if (isRight()) {
      return Either.createRight(transform(_right as R));
    } else {
      return Either.createLeft(_left as L);
    }
  }
}

Either<L, R> left<L, R>(L l) => Either<L, R>._(l, null);

Either<L, R> right<L, R>(R r) => Either<L, R>._(null, r);