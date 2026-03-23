import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InkButton extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;

  const InkButton({
    required this.child,
    required this.onTap,
    this.height,
    this.borderRadius,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? borderR8,
        child: Ink(
          height: height ?? 48.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? borderR8,
            color: color ?? context.colorScheme.primary,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }

  factory InkButton.normalText({
    required String title,
    required void Function() onTap,
    double? height,
    BorderRadius? borderRadius,
    Color? color,
  }) {
    return InkButton(
      onTap: onTap,
      height: height ?? 48.h,
      borderRadius: borderRadius ?? borderR8,
      color: color,
      child: Text(
        title,
        style: ts16w400,
      ),
    );
  }

  factory InkButton.icon({
    required Widget icon,
    required void Function() onTap,
    double? height,
    BorderRadius? borderRadius,
    Color? color,
  }) {
    return InkButton(
      onTap: onTap,
      height: height ?? 48.h,
      borderRadius: borderRadius ?? borderR8,
      color: color,
      child: icon,
    );
  }
}
