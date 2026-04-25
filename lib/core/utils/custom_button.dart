import 'package:flutter/material.dart';

class CosutmButton extends StatelessWidget {
  const CosutmButton({
    super.key,
    this.height,
    this.fontSize,
    this.width,
    this.onTap,
    required this.title,
    this.theColor = Colors.cyanAccent,
    this.fontColor = Colors.black,
    this.isLoading = false,
  });
  final String title;
  final VoidCallback? onTap;
  final Color theColor, fontColor;
  final bool isLoading;
  final double? height;
  final double? width;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: theColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 27,
                  width: 27,
                  child: CircularProgressIndicator(color: Colors.black),
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize ?? 18,
                    fontWeight: FontWeight.w500,
                    color: fontColor,
                  ),
                ),
        ),
      ),
    );
  }
}
