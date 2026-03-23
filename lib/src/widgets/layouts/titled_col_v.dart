import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitledColV extends StatelessWidget {
  final Widget title;
  final Widget value;
  final bool titlePadding;
  final Widget? spacing;

  const TitledColV({
    required this.title,
    required this.value,
    this.titlePadding = true,
    this.spacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: titlePadding ? EdgeInsets.only(left: 16.w) : EdgeInsets.zero,
          //TODO: add .w
          child: title,
        ),
        spacingV8,
        value,
      ],
    );
  }

  factory TitledColV.blueTitle(String title, Widget value) {
    return TitledColV(
      titlePadding: false,
      title: Text(title, style: ts16w400),
      value: value,
    );
  }

  factory TitledColV.text(String title, String value) {
    return TitledColV(
      titlePadding: false,
      title: Text(title, style: ts12w400),
      value: Text(value, style: ts16w400),
      spacing: spacingV4,
    );
  }
}
