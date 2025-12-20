import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.onPressed,
    super.key,
    this.borderRadius,
  });

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius:
            borderRadius ??
                const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13), // بدون radius
                ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 20, color: textColor)),
      ),
    );
  }
}
