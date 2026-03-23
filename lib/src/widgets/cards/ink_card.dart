import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InkCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double? height;
  final bool zeroHeight;
  final double? width;
  final bool zeroWidth;

  const InkCard({
    this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
    this.height,
    this.width,
    this.zeroHeight = false,
    this.zeroWidth = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderR8,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderR8,
        child: Ink(
          padding: padding,
          height: zeroHeight ? null : height ?? 60.h,
          width: zeroWidth ? null : width ?? 120.w,
          decoration: BoxDecoration(
            color: backgroundColor ?? context.theme.cardColor,
            borderRadius: borderR8,
          ),
          child: child,
        ),
      ),
    );
  }
}
