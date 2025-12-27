import 'package:flutter/material.dart';

class ShowBoxError {
  static Future<void> show(
    BuildContext context,
    String errorMessage,
      {String message = 'Error'}
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Text(message),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
