import 'package:flutter/material.dart';

extension LayoutWidgetX on List<Widget> {
  List<Widget> splitWith(
    Widget separator, {
    bool isLeadingSpacing = true,
    Widget? leadingSpacing,
    bool trailingSpacing = true,
  }) {
    return [
      if (isLeadingSpacing) leadingSpacing ?? separator,
      for (int i = 0; i < length; i++) ...[
        this[i],
        if (i != length - 1) separator,
      ],
      if (trailingSpacing) leadingSpacing ?? separator,
    ];
  }
}
