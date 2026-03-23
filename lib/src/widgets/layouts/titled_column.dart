import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class TitledColumn extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  const TitledColumn({required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title,
        spacingV8,
        Column(children: children),
      ],
    );
  }
}
