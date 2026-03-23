import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class TitledRow extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  const TitledRow({
    required this.title,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title,
        spacingV8,
        Row(
          children: children,
        ),
      ],
    );
  }
}
