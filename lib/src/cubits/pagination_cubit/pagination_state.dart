import 'package:flutter_common_utils/flutter_common_utils.dart';

class PaginationState<T> {
  final List<T> items;
  final EventState eventState;
  // TODO: use error object
  final String? errorMessage;
  final bool hasMore;

  PaginationState({
    this.items = const [],
    this.eventState = EventState.initial,
    this.errorMessage,
    this.hasMore = true,
  });

  bool get isInitial => eventState == EventState.initial;
  bool get isLoading => eventState == EventState.loading;
  bool get isData => eventState == EventState.data;
  bool get isError => eventState == EventState.error;
  bool get isEmpty => items.isEmpty;

  PaginationState<T> copyWith({
    List<T>? items,
    EventState? eventState,
    String? errorMessage,
    bool? hasMore,
  }) {
    return PaginationState(
      items: items ?? this.items,
      eventState: eventState ?? this.eventState,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is! PaginationState<T>) return false;

    return _listEquals(other.items, items) &&
        other.eventState == eventState &&
        other.errorMessage == errorMessage &&
        other.hasMore == hasMore;
  }

  @override
  int get hashCode {
    return items.fold(0, (prev, element) => prev ^ element.hashCode) ^
        eventState.hashCode ^
        (errorMessage?.hashCode ?? 0) ^
        hasMore.hashCode;
  }

  @override
  String toString() {
    return 'PaginationState(items: $items, eventState: $eventState, errorMessage: $errorMessage, hasMore: $hasMore)';
  }

  // analog from dart collections package
  bool _listEquals(List<T> list1, List<T> list2) {
    if (list1.length != list2.length) return false;

    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }

    return true;
  }
}
