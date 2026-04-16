import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.filled = false,
    this.textInputAction,
    this.thelabel,
    this.validator,
    this.preffixIcon,
    this.controller,
    this.theHintText,
    this.textType,
    this.suffixIcon,
    this.thePadding,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.colorOfFill = Colors.transparent,
    decoration,
    keyboardType,
  });

  final String? theHintText;
  final TextInputType? textType;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final EdgeInsetsGeometry? thePadding;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool obscureText, filled;
  final TextEditingController? controller;
  final String? thelabel;
  final TextInputAction? textInputAction;
  final Color colorOfFill;

  // التعديل الأساسي: استخدام String? لتمكين إرجاع null عند نجاح التحقق
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: thePadding ?? const EdgeInsets.symmetric(horizontal: 16),

      child: TextFormField(
        style: Styles.textStyleRegular30.copyWith(fontSize: 18),
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        obscuringCharacter: '●', // هنا نحدد شكل الدائرة يدوياً
        onSaved: onSaved,
        keyboardType: textType,
        textInputAction: TextInputAction.next,

        // التحقق من البيانات
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "field is required";
              }
              return null;
            },

        decoration: InputDecoration(
          // نصوص الحقل
          labelText: thelabel,
          hintText: theHintText,
          labelStyle: Styles.textStyleRegular30.copyWith(fontSize: 16),
          hintStyle: Styles.textStyleRegular30.copyWith(
            fontSize: 18,
            color: Colors.grey,
          ),

          // الأيقونات (تظهر كما في صورتك الثانية)
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,

          // التصميم المطلوب: بدون لون خلفية (شفاف)
          filled: filled,
          fillColor: colorOfFill,
          // إعدادات الحدود (Borders) لتطابق الصورة
          enabledBorder: buildBorder(color: Colors.grey.shade400),
          // focusedBorder: buildBorder(color: AppColors.blackColor, width: 2),
          focusedBorder: buildBorder(
            color: const Color.fromARGB(255, 63, 36, 36),
            width: 2,
          ),

          // إعدادات حالة الخطأ
          errorBorder: buildBorder(color: Colors.red),
          focusedErrorBorder: buildBorder(color: Colors.red, width: 2),

          // تنسيق المسافات الداخلية
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
        ),
      ),
    );
  }

  // دالة موحدة لإنشاء الحدود
  OutlineInputBorder buildBorder({required Color color, double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: BorderRadius.circular(8), // انحناء خفيف مثل الصورة
    );
  }
}

//////////////////////////////////
// class CoustomTextField extends StatelessWidget {
//   const CoustomTextField({
//     super.key,
//      this.hintText,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.obscureText = false,
//     this.validator, required InputDecoration decoration, required TextInputType keyboardType, // أضف هذا السطر
//   });

//   final String? hintText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final bool obscureText;
//   final String? Function(String?)? validator; // تعريف الوظيفة

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator, // ربط الوظيفة هنا
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hintText,
//         prefixIcon: prefixIcon,
//         suffixIcon: suffixIcon,
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }
// }
