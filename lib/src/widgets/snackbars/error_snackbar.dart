import 'package:flutter/material.dart';

//TODO: add localization
void showErrorSnackBar(BuildContext context, {String? text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text ?? 'An unknown error has occurred')),
  );
}
