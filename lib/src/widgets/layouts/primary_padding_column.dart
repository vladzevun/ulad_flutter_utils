import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class PrimaryPaddingColumn extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsetsGeometry? padding;

  const PrimaryPaddingColumn({
    required this.children,
    this.crossAxisAlignment,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? edgeInsetsH16,
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
