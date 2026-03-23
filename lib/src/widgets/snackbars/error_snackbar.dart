import 'package:flutter/material.dart';

class ErrorSnackbar extends StatelessWidget {
  const ErrorSnackbar({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void showErrorSnackBar(BuildContext context, {String? text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text ?? 'An unknown error has occurred')));
}
