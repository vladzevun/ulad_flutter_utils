import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class RowItemV extends StatelessWidget {
  final Widget title;
  final Widget value;
  final Widget? spacing;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const RowItemV({
    required this.title,
    required this.value,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.spacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [title, if (spacing != null) spacing!, value],
    );
  }

  // factory RowItemV.icon({
  //   required SvgGenImage icon,
  //   required String title,
  //   TextStyle? ts,
  // }) {
  //   return RowItemV(
  //     title: icon.svg(),
  //     spacing: spacingH16,
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     value: Text(title, style: ts ?? ts14w400),
  //   );
  // }

  // factory RowItemV.iconTitle({
  //   required SvgGenImage icon,
  //   required String title,
  // }) {
  //   return RowItemV.icon(icon: icon, title: title, ts: ts16w500);
  // }

  factory RowItemV.flex({
    required String title,
    required Widget value,
    int? titleFlex,
    int valueFlex = 1,
  }) {
    final text = Text(title, style: ts16w400);

    return RowItemV(
      title: titleFlex == null
          ? text
          : Flexible(fit: FlexFit.tight, flex: titleFlex, child: text),
      spacing: spacingH16,
      mainAxisAlignment: MainAxisAlignment.start,
      value: Expanded(flex: valueFlex, child: value),
    );
  }
}
