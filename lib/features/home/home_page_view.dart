import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/features/home/home_page_view_body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

List<IconData> navIcons = [Icons.home, Icons.wallet, Icons.person];
List<String> navTitle = ["Home", "wallet", "Account"];

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: Stack(
        children: [
          HomePageViewBody(),
          Align(alignment: AlignmentGeometry.bottomCenter, child: _navBar()),
        ],
      ),
    );
  }

  Widget _navBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65, // زيادة طفيفة لراحة العناصر عمودياً ومنع أي اختناق
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
        decoration: BoxDecoration(
          color: AppColors.kCardMoreNavy,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navIcons.length, (index) {
            // فحص هل هذا العنصر هو المحدد حالياً أم لا
            bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex =
                      index; // تحديث الـ index عند الضغط لإعادة بناء الشاشة
                });
              },
              child: Container(
                // لتوسيع منطقة الضغط وجعل الاستجابة أسهل للمستخدم
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      navIcons[index],
                      // إذا كان مختاراً يظهر بالبرتقالي، وإلا بالرمادي/الأبيض الخافت
                      color: isSelected ? Colors.orange : Colors.grey.shade500,
                      size: 22,
                    ),
                    const SizedBox(
                      height: 2,
                    ), // مسافة صغيرة جداً بين الأيقونة والنص
                    Text(
                      navTitle[index],
                      style: TextStyle(
                        // تغيير لون النص أيضاً بناءً على الاختيار
                        color: isSelected
                            ? Colors.orange
                            : Colors.grey.shade500,
                        fontSize: 11,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
