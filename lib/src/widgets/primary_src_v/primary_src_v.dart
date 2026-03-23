import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class PrimarySRCV<T, CubitT extends SingleRequestCubit<T>>
    extends StatefulWidget {
  final Widget Function(T data) successBuilder;

  const PrimarySRCV({super.key, required this.successBuilder});

  @override
  PrimarySRCVState<T, CubitT> createState() => PrimarySRCVState<T, CubitT>();
}

class PrimarySRCVState<T, CubitT extends SingleRequestCubit<T>>
    extends State<PrimarySRCV<T, CubitT>> {
  @override
  void initState() {
    context.read<CubitT>().loadIfEmpty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitT, SingleRequestState<T>>(
      builder: (context, state) {
        if (state.isError) {
          return TryAgainV(onTap: () => context.read<CubitT>().loadData());
        }
        if (state.isLoading) {
          return PrimaryLoading();
        }
        if (state.data != null) {
          return widget.successBuilder.call(state.data as T);
        }
        if (state.isEmpty) {
          //TODO: make empty state more informative
          //TODO: add localization
          return Text('Пусто');
        }
        return const SizedBox();
      },
    );
  }
}
