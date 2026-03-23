import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.backgroundColor,
    this.iconSize = 32,
    this.text,
  });

  final double? width;
  final double? height;
  final double borderRadius;
  final Color? backgroundColor;
  final double iconSize;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width ?? 164.h,
        height: height ?? 164.h,
        color: backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error,
              size: iconSize,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            if (text != null) ...[
              const SizedBox(height: 6),
              Text(
                text!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
