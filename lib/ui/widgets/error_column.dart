import 'package:flutter/material.dart';

class ErrorList extends StatelessWidget {
  const ErrorList({required this.validatingErrors, Key? key}) : super(key: key);
  final List<String> validatingErrors;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: validatingErrors
            .map(
              (error) => Text(
                error,
                style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            )
            .toList());
  }
}
