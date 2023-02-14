import 'package:flutter/material.dart';

showSnackbarW(
    {required BuildContext context,
    required String message,
    required bool isError}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
    ),
    duration: const Duration(milliseconds: 500),
    backgroundColor: isError ? Colors.red : Colors.green,
  ));
}
