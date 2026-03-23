import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class HorizontalCardsV extends StatelessWidget {
  final List<Widget> children;
  final Widget? spacing;
  final bool? isLeadingSpacing;

  const HorizontalCardsV({
    required this.children,
    this.isLeadingSpacing,
    this.spacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: children.splitWith(
          spacing ?? spacingH16,
          leadingSpacing: spacingH16,
          trailingSpacing: true,
          isLeadingSpacing: isLeadingSpacing ?? true,
        ),
      ),
    );
  }
}
