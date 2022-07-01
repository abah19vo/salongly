import 'package:flutter/material.dart';
import 'package:salongly/app/theme.dart';

class ErrorList extends StatelessWidget {
  const ErrorList({required this.validatingErrors, Key? key}) : super(key: key);
  final List<String> validatingErrors;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: validatingErrors
              .map(
                (error) => Text(
                  error,
                  style: TextStyle(
                    color: CustomeColors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              )
              .toList()),
    );
  }
}
