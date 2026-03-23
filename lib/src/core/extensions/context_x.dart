import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);

  Color get iconColor => Theme.of(this).iconTheme.color!;

  ScreenUtil get screenUtil => ScreenUtil();
}
