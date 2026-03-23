import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_common_utils/src/cubits/cubits.dart';
// ignore: always_use_package_imports

abstract class PaginationCubit<T> extends Cubit<PaginationState<T>> {
  final int _pageSize;
  final int _startingIndex;
  int _offset;

  PaginationCubit({int pageSize = 10, int startingIndex = 0})
    : _pageSize = pageSize,
      _startingIndex = startingIndex,
      _offset = startingIndex,
      super(PaginationState());

  /// Override it to receive data from appropriate repos
  Future<Either<String?, List<T>>> getPage({
    required int page,
    required int pageSize,
    String? filter,
  });

  bool _isLoading = false;

  /// Called on scroll controller reaches bottom of the page
  Future<void> loadNextPage({String? filter}) async {
    if (state.eventState == EventState.loading || !state.hasMore || _isLoading) {
      return;
    }
    _isLoading = true;
    emit(state.copyWith(eventState: EventState.loading));

    final request = await getPage(
      page: _offset,
      pageSize: _pageSize,
      filter: filter,
    );

    request.fold(
      (e) =>
          emit(state.copyWith(eventState: EventState.error, errorMessage: e)),
      (data) {
        emit(
          state.copyWith(
            eventState: EventState.data,
            errorMessage: null,
            items: [...state.items, ...data],
            hasMore: data.length == _pageSize,
          ),
        );
        _offset += _pageSize;
      },
    );
    _isLoading = false;
  }

  /// Removes all data from cubit items state and sets currentPage to 0
  void _reset() {
    _offset = _startingIndex;
    emit(
      PaginationState(
        items: [],
        eventState: EventState.initial,
        hasMore: true,
        errorMessage: null,
      ),
    );
  }

  /// Resets and tries to loads first page
  Future<void> refresh({String? filter}) async {
    _reset();
    await loadNextPage(filter: filter);
  }
}
