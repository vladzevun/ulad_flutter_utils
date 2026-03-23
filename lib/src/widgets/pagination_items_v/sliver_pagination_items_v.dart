import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class SliverPaginationItemsV<T, C extends PaginationCubit<T>>
    extends StatefulWidget {
  final void Function(T item) onSelect;
  final String Function(T item) valueSearchField;
  final Widget Function(T item, bool isInitial)? itemBuilder;
  final VoidCallback? onRefreshCallback;
  final T? initialValue;
  final List<Widget>? headerSlivers;
  final Widget? verticalSpacing;
  final EdgeInsets? padding;

  const SliverPaginationItemsV({
    required this.onSelect,
    required this.valueSearchField,
    this.onRefreshCallback,
    this.itemBuilder,
    this.initialValue,
    this.headerSlivers,
    this.verticalSpacing,
    super.key,
    this.padding,
  });

  @override
  State<SliverPaginationItemsV<T, C>> createState() =>
      _SliverPaginationItemsVState<T, C>();
}

class _SliverPaginationItemsVState<T, C extends PaginationCubit<T>>
    extends State<SliverPaginationItemsV<T, C>> {
  late final C _cubit = BlocProvider.of<C>(context);
  late final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _cubit.loadNextPage();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _cubit.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.onRefreshCallback?.call();
        await context.read<C>().refresh();
      },
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: [
          if (widget.headerSlivers != null) ...widget.headerSlivers!,
          SliverPadding(
            padding: widget.padding ?? EdgeInsets.zero,
            sliver: BlocBuilder<C, PaginationState<T>>(
              builder: (context, state) {
                if (state.isLoading && state.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                }
                if (state.isError && state.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _cubit.loadNextPage(),
                        // TODO: add localization
                        child: Text("Ошибка. Повторить"),
                      ),
                    ),
                  );
                }

                if (state.isEmpty) {
                  return const SliverToBoxAdapter(
                    // TODO: add localization
                    child: Center(child: Text("Ничего нет")),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index >= state.items.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final item = state.items[index];

                    return Column(
                      children: [
                        widget.itemBuilder!(item, item == widget.initialValue),
                        widget.verticalSpacing ?? const SizedBox(height: 4),
                      ],
                    );
                  }, childCount: state.items.length + (state.hasMore ? 1 : 0)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
