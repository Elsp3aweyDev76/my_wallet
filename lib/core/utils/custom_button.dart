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
    // التحقق مما إذا كان الزر يجب أن يكون معطلاً (إما لأنه في حالة تحميل أو لم يتم تمرير دالة اضغط)
    final bool isDisabled = isLoading || onTap == null;

    return GestureDetector(
      // إذا كان معطلاً، نمرر null لمنع أي ضغط، وإلا ننفذ الدالة
      onTap: isDisabled ? null : onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isDisabled ? 0.6 : 1.0, // تخفيف الشفافية عند التعطيل لإعطاء إيحاء بصري للمستخدم
        child: Container(
          height: height ?? 50,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: theColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 27,
                    width: 27,
                    child: CircularProgressIndicator(
                      // جعل لون مؤشر التحميل يتماشى مع لون النص الممرر للزر
                      color: fontColor,
                      strokeWidth: 3, // سماكة خط التحميل ليظهر بشكل أرتب
                    ),
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
      ),
    );
  }
}