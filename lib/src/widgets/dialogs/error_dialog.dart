import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String description;

  const ErrorDialog({
    required this.description,
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          //TODO: add localization
          child: Text('Ok'),
        ),
      ],
    );
  }
}

//TODO: add localization
void showErrorDialog(
  BuildContext context, {
  String? text,
  String title = 'Error',
}) {
  showDialog(
    context: context,
    builder: (context) => ErrorDialog(description: text ?? '', title: title),
  );
}
