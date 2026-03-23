import 'package:flutter_common_utils/flutter_common_utils.dart';

class SingleRequestState<T> {
  final T? data;
  final EventState eventState;
  final String? errorMessage;
  final bool hasMore;

  SingleRequestState({
    this.data,
    this.eventState = EventState.initial,
    this.errorMessage,
    this.hasMore = true,
  });

  bool get isInitial => eventState == EventState.initial;
  bool get isLoading => eventState == EventState.loading;
  bool get isData => eventState == EventState.data;
  bool get isError => eventState == EventState.error;
  bool get isEmpty => data == null;

  SingleRequestState<T> copyWith({
    T? data,
    EventState? eventState,
    String? errorMessage,
    bool? hasMore,
  }) {
    return SingleRequestState(
      data: data ?? this.data,
      eventState: eventState ?? this.eventState,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is! SingleRequestState<T>) return false;

    return other.data == data &&
        other.eventState == eventState &&
        other.errorMessage == errorMessage &&
        other.hasMore == hasMore;
  }

  @override
  int get hashCode {
    return data.hashCode ^
        eventState.hashCode ^
        (errorMessage?.hashCode ?? 0) ^
        hasMore.hashCode;
  }

  @override
  String toString() {
    return 'SingleRequestState(data: $data, eventState: $eventState, errorMessage: $errorMessage, hasMore: $hasMore)';
  }
}
