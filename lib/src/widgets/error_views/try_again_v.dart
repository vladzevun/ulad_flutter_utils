import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: rename
class TryAgainV extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  const TryAgainV({this.title, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final shadow = Theme.of(context).shadowColor.withValues(alpha: 0.12);

    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 16.w,
          right: 16.w,
          bottom: 4.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 0.5,
            ),
            BoxShadow(
              color: shadow.withValues(alpha: 0.08),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO: add localization
            Text(title ?? 'Error while loading', style: ts16w600),
            spacingV8,
            //TODO: add localization
            TextButton(onPressed: onTap, child: Text('Try again')),
          ],
        ),
      ),
    );
  }
}
