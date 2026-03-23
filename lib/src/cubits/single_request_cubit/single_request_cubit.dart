import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

abstract class SingleRequestCubit<T> extends Cubit<SingleRequestState<T>> {
  SingleRequestCubit() : super(SingleRequestState());

  /// Override it to receive data from appropriate repos
  Future<Either<String?, T>> getData();

  bool _isLoading = false;
  Future<void> loadData() async {
    if (state.eventState == EventState.loading ||
        !state.hasMore ||
        _isLoading) {
      return;
    }
    _isLoading = true;
    emit(state.copyWith(eventState: EventState.loading));

    final request = await getData();

    request.fold(
      (e) =>
          emit(state.copyWith(eventState: EventState.error, errorMessage: e)),
      (data) {
        emit(
          state.copyWith(
            eventState: EventState.data,
            errorMessage: null,
            data: data,
          ),
        );
      },
    );
    _isLoading = false;
  }

  void resetAndRefresh() async {
    await refresh();
  }

  /// Resets and tries to loads first page
  Future<void> refresh() async {
    await loadData();
  }

  void loadIfEmpty() {
    if (state.data == null) {
      loadData();
    }
  }
}
