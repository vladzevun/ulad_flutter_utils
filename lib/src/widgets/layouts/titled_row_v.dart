import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class TitledRowV extends StatelessWidget {
  final Widget title;
  final Widget value;
  final Widget? spacing;

  const TitledRowV({
    required this.title,
    required this.value,
    this.spacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        title,
        spacingH8,
        value
      ],
    );
  }

  factory TitledRowV.textExpanded(String title, String value) {
    return TitledRowV(
      title: Expanded(child: Text(title, style: ts16w400)),
      value: Expanded(child: Text(value, style: ts16w500)),
      spacing: spacingH4,
    );
  }

  factory TitledRowV.textSmallExpanded(String title, String value) {
    return TitledRowV(
      title: Expanded(child: Text(title, style: ts12w400)),
      value: Expanded(child: Text(value, style: ts12w400)),
      spacing: spacingH4,
    );
  }

  factory TitledRowV.textBigExpanded(String title, String value) {
    return TitledRowV(
      title: Expanded(child: Text(title, style: ts19w400)),
      value: Expanded(child: Text(value, style: ts19w400)),
      spacing: spacingH4,
    );
  }

  factory TitledRowV.textValueExpanded(String title, String value) {
    return TitledRowV(
      title: Text(title, style: ts16w400),
      value: Expanded(child: Text(value, style: ts16w500)),
      spacing: spacingH4,
    );
  }
}
