import 'package:flutter/material.dart';

SnackBar happySnack(String text) => SnackBar(
      backgroundColor: Colors.green.shade900,
      content: Text(text),
      elevation: 2,
    );

SnackBar sadSnack(String text) => SnackBar(
  backgroundColor: Colors.red.shade900,
  content: Text(text),
  elevation: 2,
);

void showHappySnack(BuildContext context, String text) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar((happySnack(text)));
}

void showSadSnack(BuildContext context, String text) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar((sadSnack(text)));
}
