import 'package:flutter/material.dart';

extension FormKeyX on GlobalKey<FormState> {
  bool validateForm() {
    return currentState?.validate() ?? false;
  }
}
