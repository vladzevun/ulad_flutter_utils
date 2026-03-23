enum EventState {
  initial,
  loading,
  data,
  error,
}

extension EventStateX on EventState {
  bool get isLoading => this == EventState.loading;
  bool get isInitial => this == EventState.initial;
  bool get isData => this == EventState.data;
  bool get isError => this == EventState.error;
}