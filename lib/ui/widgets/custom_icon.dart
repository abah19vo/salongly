import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
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
          color: isSelected ? Colors.blue : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          icon,
          size: 25.0,
          color: isSelected ? Colors.white : Color.fromARGB(255, 98, 107, 109),
        ),
      ),
    );
  }
}
