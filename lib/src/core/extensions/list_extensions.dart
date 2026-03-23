extension ListX<T> on List<T> {
  bool isFirst(T e) {
    return indexOf(e) == 0;
  }

  bool isLast(T e) {
    return indexOf(e) == length - 1;
  }

  bool containsAtLeastOne(Iterable<T> list) {
    for (var e in list) {
      if (contains(e)) return true;
    }
    return false;
  }

  List<List<T>> splitBy(int split, {T? filler}) {
    final List<List<T>> result = [];
    List<T> node = [];
    var count = 0;
    for (var item in this) {
      node.add(item);
      count++;
      if (count == split) {
        count = 0;
        result.add(node);
        node = [];
      }
    }
    if (node.isNotEmpty) {
      if (filler != null) {
        while (count >= node.length) {
          node.add(filler);
        }
      }

      result.add(node);
    }
    return result;
  }
}
