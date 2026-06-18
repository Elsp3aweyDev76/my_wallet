import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/networking/fire_base_function.dart'; // استيراد دالة الحذف

class LabelsTransactions extends StatelessWidget {
  const LabelsTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return const Center(child: Text("Please log in to see transactions"));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('userTransactin')
          .doc(userId)
          .collection('transactions')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(color: AppColors.kPrimaryOrange),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "No transactions added yet.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          );
        }

        final transactionsDocs = snapshot.data!.docs;

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: transactionsDocs.length,
          itemBuilder: (context, index) {
            final doc = transactionsDocs[index]; // الوثيقة بالكامل
            final data = doc.data() as Map<String, dynamic>;
            final String transactionId = doc.id; // 👈 جلب الـ ID الفريد للحذف

            String transactionName = (data['name'] ?? 'Unknown').toString();
            String transactionPrice = (data['price'] ?? '0').toString();
            String transactionDate = (data['date'] ?? 'No Date').toString();

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppConstants.knumberOfPadding8,
              ),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.kblackColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppConstants.knumberOfPadding16,
                        right: 45, // زيادة المسافة اليمنى لكي لا تتداخل النصوص مع زر الحذف والخط الأصفر
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppConstants.knumberOfPadding8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  transactionName,
                                  style: AppStyles.textStyleMedium18,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  transactionDate,
                                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),

                          // وضع السعر وزر الحذف في Row مستقل جهة اليمين
                          Row(
                            children: [
                              Text(
                                "$transactionPrice EGP",
                                style: AppStyles.textStyleMedium18.copyWith(
                                  color: AppColors.kPrimaryOrange,
                                ),
                              ),
                              const SizedBox(width: 8),
                              // 👈 زر الحذف (سلة المهملات)
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.redAccent,
                                  size: 22,
                                ),
                                onPressed: () {
                                  // استدعاء دالة الحذف وتمرير الـ الـ IDs المطلوبة
                                  FireBaseFunction().deleteTransaction(userId, transactionId);

                                  // إظهار تنبيه بسيط للمستخدم أسفل الشاشة
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Transaction deleted successfully'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 70,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: AppColors.kAccentYellow,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppConstants.knumberOfCirculer),
                            bottomRight: Radius.circular(AppConstants.knumberOfCirculer),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}