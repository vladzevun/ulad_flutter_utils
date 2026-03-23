// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:taxpayer_application_mobile/generated/locale_keys.g.dart';
// import 'package:taxpayer_application_mobile/redesign/common/common.dart';
// import 'package:taxpayer_application_mobile/redesign/generated/assets.gen.dart';
//
// extension LocaleX on Locale {
//   static String toJson(Locale locale) => locale.languageCode;
//
//   static Locale fromJson(String languageCode) => Locale(languageCode);
//
//   Widget get imageSvgBuilder {
//     switch (languageCode) {
//       case AppConstants.appLangCodeKy:
//         return Assets.redesign.svgs.flagKy.svg();
//
//       case AppConstants.appLangCodeRu:
//         return Assets.redesign.svgs.flagRu.svg();
//
//       default:
//         return SizedBox(height: 24.h, width: 24.w);
//     }
//   }
//
//   String get localeName {
//     switch (languageCode) {
//       case AppConstants.appLangCodeKy:
//         return LocaleKeys.kyrgyz.tr();
//
//       case AppConstants.appLangCodeRu:
//         return LocaleKeys.russian.tr();
//
//       default:
//         return '';
//     }
//   }
//
//   String get localeShortName {
//     switch (languageCode) {
//       case AppConstants.appLangCodeKy:
//         return LocaleKeys.ky_short.tr();
//
//       case AppConstants.appLangCodeRu:
//         return LocaleKeys.ru_short.tr();
//
//       default:
//         return '';
//     }
//   }
// }
