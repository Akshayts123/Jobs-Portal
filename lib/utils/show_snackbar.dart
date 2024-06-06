import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message, {Color? color}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? Colors.blueGrey,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
