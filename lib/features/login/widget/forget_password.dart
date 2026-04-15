import 'package:flutter/material.dart';

// استخدام نفس الثوابت اللونية لمشروعك
const Color kPrimaryOrange = Color(0xFFFF6B2C);
const Color kAccentYellow = Color(0xFFFDBB2D);
const Color kPureBlackBG = Color(0xFF000000);
const Color kCardNavy = Color(0xFF121212);
const Color kPureWhite = Color(0xFFFFFFFF);
const Color kTextSecondary = Color(0xFF9E9E9E);

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // للتبديل بين واجهة إدخال البريد وواجهة إدخال الرمز (Logic بسيط للـ UI)
  bool isStepTwo = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPureBlackBG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: kPureWhite, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // --- العنوان الوصفي ---
            Text(
              isStepTwo ? "تحقق من بريدك" : "نسيت كلمة المرور؟",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kPureWhite),
            ),
            const SizedBox(height: 12),
            Text(
              isStepTwo 
                ? "أدخل الرمز المكون من 4 أرقام الذي أرسلناه إلى بريدك الإلكتروني."
                : "لا تقلق، أدخل بريدك الإلكتروني وسنرسل لك رمزاً لإعادة تعيين كلمة المرور.",
              style: const TextStyle(fontSize: 15, color: kTextSecondary, height: 1.5),
            ),

            const SizedBox(height: 40),

            // --- تغيير الواجهة بناءً على الخطوة الحالية ---
            if (!isStepTwo) ...[
              _buildInputLabel("البريد الإلكتروني"),
              _buildTextField(hint: "name@email.com", icon: Icons.alternate_email),
            ] else ...[
              _buildInputLabel("رمز التحقق (OTP)"),
              _buildOTPFields(), // ويدجت مربعات الرمز
            ],

            const SizedBox(height: 40),

            // --- زر الاستمرار الرئيسي ---
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isStepTwo = true; // محاكاة الانتقال للخطوة التالية
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryOrange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  isStepTwo ? "تحقق الآن" : "إرسال الرمز",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPureWhite),
                ),
              ),
            ),
            
            if (isStepTwo) 
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("إعادة إرسال الرمز", style: TextStyle(color: kAccentYellow)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // --- مساعدات بناء الواجهة (Helpers) ---

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(label, style: const TextStyle(color: kPureWhite, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon}) {
    return TextField(
      style: const TextStyle(color: kPureWhite),
      decoration: InputDecoration(
        filled: true,
        fillColor: kCardNavy,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24),
        prefixIcon: Icon(icon, color: kPrimaryOrange, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }

  // مربعات الرمز OTP بنمط عصري
  Widget _buildOTPFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) => SizedBox(
        width: 65,
        height: 70,
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kPureWhite),
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: kCardNavy,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kPrimaryOrange.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: kPrimaryOrange, width: 2),
            ),
          ),
        ),
      )),
    );
  }
}