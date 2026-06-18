import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/networking/fire_base_function.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/core/utils/custom_button.dart';
import 'package:my_wallet/core/utils/custom_text_field.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  // مفتاح الفورم للتحكم في عملية الـ Validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // تعريف الـ Controllers للحقول
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // 1️⃣ إعطاء قيمة بدائية بتاريخ اليوم عند بناء الشاشة لأول مرة
  @override
  // void prenatalState() {} // (ملاحظة داخلية فقط)
  @override
  void initState() {
    super.initState();
    // تنسيق تاريخ اليوم الحالي ووضعه داخل الـ Controller مباشرة
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFFF6B2C),
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void dispose() {
    // تنظيف جميع الـ Controllers عند إغلاق الشاشة
    _nameController.dispose();
    _priceController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2️⃣ جعل الـ Container هو الأب المباشر هنا ليمتد التدرج اللوني خلف حواف الهاتف (امتداد كامل بدون سواد)
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.knumberOfPadding16,
        ),
        decoration: BoxDecoration(gradient: AppColors.kColorOfBackGround),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // شريط العنوان العلوي
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          GoRouter.of(context).go(kHomeView);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Add Transactions",
                        style: AppStyles.textStyleRegular20,
                      ),
                      const SizedBox(
                        width: 48,
                      ), // لموازنة السهم الأيمن بدقة ليصبح العنوان في المنتصف تماماً
                    ],
                  ),

                  const SizedBox(height: 50),

                  // --- حقل الاسم مع الـ Validation ---
                  CustomTextFormField(
                    controller: _nameController,
                    preffixIcon: const Icon(Icons.perm_identity_rounded),
                    theHintText: "Name",
                    thelabel: "Name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),

                  // --- حقل السعر مع الـ Validation ---
                  CustomTextFormField(
                    controller: _priceController,
                    preffixIcon: const Icon(Icons.attach_money_rounded),
                    textType: TextInputType.number,
                    theHintText: "Price",
                    thelabel: "Price",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Price is required";
                      }
                      final num? price = num.tryParse(value);
                      if (price == null) {
                        return 'رجاءً أدخل رقم صحيح';
                      }
                      if (price <= 0) {
                        return 'السعر يجب أن يكون أكبر من صفر';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),

                  // --- حقل التاريخ مع الـ Validation والقيمة البدائية ---
                  CustomTextFormField(
                    controller: _dateController,
                    readOnly: true,
                    preffixIcon: const Icon(Icons.date_range_rounded),
                    theHintText: "Date",
                    thelabel: "Date",
                    textType: TextInputType.datetime,
                    onTap: () {
                      _selectDate(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date is required";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 60),

                  // --- زر الحفظ والتحقق ---
                  CosutmButton(
                    // onTap: () {
                    //   if (_formKey.currentState!.validate()) {
                    //     if (_nameController.text.isNotEmpty &&
                    //         _priceController.text.isNotEmpty &&
                    //         _dateController.text.isNotEmpty) {
                    //       FireBaseFunction().addtransection(
                    //         FirebaseAuth.instance.currentUser!.uid,
                    //         _nameController.text,
                    //         _priceController.text,
                    //         _dateController.text,
                    //       );
                    //     }
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(
                    //         content: Text('جاري حفظ المعاملة...'),
                    //         backgroundColor: Colors.green,
                    //       ),
                    //     );
                    //     GoRouter.of(context).push(kHomeView);
                    //   }
                    // },
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // جلب الـ UID بأمان لمنع الـ Crash
                        final user = FirebaseAuth.instance.currentUser;
                        if (user == null) return;

                        // إظهار رسالة للمستخدم فوراً
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Saving transaction...'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // 1️⃣ إرسال البيانات إلى Firebase
                        await FireBaseFunction().addtransection(
                          user.uid,
                          _nameController.text.trim(),
                          _priceController.text.trim(),
                          _dateController.text,
                        );

                        // 2️⃣ العودة إلى الصفحة الرئيسية فوراً بعد اكتمال الحفظ
                        if (context.mounted) {
                          GoRouter.of(context).go(kHomeView);
                        }
                      }
                    },
                    width: double.infinity,
                    height: 52,
                    title: "Save",
                    theColor: AppColors.kredColor,
                    fontSize: AppConstants.knumberOfPadding30,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
