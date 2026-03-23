import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

class PaginationErrorV extends StatelessWidget {
  final String? title;
  final String? description;
  final VoidCallback? onTap;

  const PaginationErrorV({this.title, this.description, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO: add localization
        Text(title ?? 'Error while loading', style: ts16w600),
        if (description != null) Text(description!, style: ts14w500),
        //TODO: add localization
        TextButton(onPressed: onTap, child: Text('Try again')),
      ],
    );
  }
}
