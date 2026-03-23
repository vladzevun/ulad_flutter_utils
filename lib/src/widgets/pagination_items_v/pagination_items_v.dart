import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_common_utils/src/cubits/cubits.dart';
import 'package:flutter_common_utils/src/widgets/empty_views/empty_views.dart';
import 'package:flutter_common_utils/src/widgets/error_views/error_views.dart';
import 'package:flutter_common_utils/src/widgets/loadings/loadings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationItemsV<T, C extends PaginationCubit<T>> extends StatefulWidget {
  final void Function(T item) onSelect;
  final String Function(T item) valueSearchField;
  final String Function(T item)? itemLabel;
  final Widget Function(T item, bool isInitial)? itemBuilder;
  final Widget? verticalSpacing;
  final T? initialValue;
  final String? title;
  final String? searchHintText;
  final List<Widget>? headerWidgets;
  final bool ignoreInitialSpacing;

  const PaginationItemsV({
    required this.onSelect,
    required this.valueSearchField,
    this.itemLabel,
    this.itemBuilder,
    this.verticalSpacing,
    this.initialValue,
    this.title,
    this.searchHintText,
    this.headerWidgets,
    this.ignoreInitialSpacing = false,
    super.key,
  }) : assert(
         itemLabel != null || itemBuilder != null,
         'Either itemLabel or itemBuilder must be provided.',
       );

  @override
  PaginationItemsVState<T, C> createState() => PaginationItemsVState<T, C>();
}

class PaginationItemsVState<T, C extends PaginationCubit<T>>
    extends State<PaginationItemsV<T, C>> {
  late final ScrollController _scrollController = ScrollController();
  late final C _cubit = BlocProvider.of<C>(context);
  late final _searchTextValue = ValueNotifier<String>('');
  final _textController = TextEditingController();

  @override
  void initState() {
    _cubit.loadNextPage();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    // TODO find optimal value to start loading before scroll reaches end
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _cubit.loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _searchTextValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: BlocBuilder<C, PaginationState<T>>(
            builder: (context, state) {
              if (state.isLoading && state.isEmpty) {
                return PrimaryLoading();
              }
              if (state.isError && state.isEmpty) {
                return PaginationErrorV(
                  description: state.errorMessage,
                  onTap: () => _cubit.loadNextPage(),
                );
              }
              if (state.isEmpty) {
                return PaginationEmptyV();
              }
              return ValueListenableBuilder(
                valueListenable: _searchTextValue,
                builder: (context, filter, child) {
                  final items = state.items;
                  return RefreshIndicator(
                    onRefresh: () => _cubit.refresh(),
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: items.length + (state.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= items.length) {
                          return PaginationEndLoading();
                        }
                        final item = items[index];
                        return Column(
                          children: [
                            if (index == 0 && !widget.ignoreInitialSpacing)
                              spacingV24,
                            if (index == 0 && widget.headerWidgets != null)
                              ...widget.headerWidgets!,
                            widget.itemBuilder != null
                                ? widget.itemBuilder!(item, isSelected(item))
                                : Text(item.toString()),
                            // BottomSheetItem(
                            //   label: widget.itemLabel!.call(item),
                            //   isSelected: isSelected(item),
                            //   isLastOne: index == items.length - 1,
                            //   onTap: () => widget.onSelect(item),
                            // ),
                            widget.verticalSpacing ?? spacingV4,
                            if (index == items.length - 1)
                              SizedBox(height: 58.h),
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  bool isSelected(T value) => value == widget.initialValue;
}
