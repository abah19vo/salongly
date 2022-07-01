import 'package:flutter/material.dart';
import 'package:salongly/app/theme.dart';

class CustomeIcon extends StatelessWidget {
  const CustomeIcon({
    Key? key,
    this.onTap,
    required this.isSelected,
    this.icon,
  }) : super(key: key);
  final void Function()? onTap;
  final bool isSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: isSelected ? CustomeColors.green : CustomeColors.lightgrey,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          icon,
          size: 25.0,
          color: isSelected ? CustomeColors.white : CustomeColors.grey,
        ),
      ),
    );
  }
}
