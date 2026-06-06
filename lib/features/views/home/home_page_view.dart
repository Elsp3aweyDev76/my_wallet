// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:my_wallet/core/constants/constants.dart';
// import 'package:my_wallet/core/routing/go_router.dart';
// import 'package:my_wallet/features/views/home/home_page_view_body.dart';

// class HomePageView extends StatefulWidget {
//   const HomePageView({super.key});

//   @override
//   State<HomePageView> createState() => _HomePageViewState();
// }

// List<IconData> navIcons = [Icons.home, Icons.wallet, Icons.person];
// List<String> navTitle = ["Home", "wallet", "Account"];

// class _HomePageViewState extends State<HomePageView> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: const Text('Home')),
//       body: Stack(
//         children: [
//           HomePageViewBody(),
//           Align(alignment: AlignmentGeometry.bottomCenter, child: _navBar()),
//         ],
//       ),
//     );
//   }

//   Widget _navBar() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         height: 65, // زيادة طفيفة لراحة العناصر عمودياً ومنع أي اختناق
//         margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 65, 7, 7),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(navIcons.length, (index) {
//             // فحص هل هذا العنصر هو المحدد حالياً أم لا
//             bool isSelected = _selectedIndex == index;

//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _selectedIndex =
//                       index; // تحديث الـ index عند الضغط لإعادة بناء الشاشة
//                 });
//                 if (index == 0) {
//                   context.go(kHomeView);
//                 } else if (index == 1) {
//                   context.push(kWalletView); // الانتقال لصفحة المحفظة الجديدة
//                 } else if (index == 2) {
//                   context.push(kUserView); // الانتقال لصفحة الحساب الجديدة
//                 }
//               },

//               child: Container(
//                 // لتوسيع منطقة الضغط وجعل الاستجابة أسهل للمستخدم
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 4,
//                 ),
//                 color: Colors.transparent,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       navIcons[index],
//                       // إذا كان مختاراً يظهر بالبرتقالي، وإلا بالرمادي/الأبيض الخافت
//                       color: isSelected ? Colors.orange : Colors.grey.shade500,
//                       size: 22,
//                     ),
//                     const SizedBox(
//                       height: 2,
//                     ), // مسافة صغيرة جداً بين الأيقونة والنص
//                     Text(
//                       navTitle[index],
//                       style: TextStyle(
//                         // تغيير لون النص أيضاً بناءً على الاختيار
//                         color: isSelected
//                             ? Colors.orange
//                             : Colors.grey.shade500,
//                         fontSize: 11,
//                         fontWeight: isSelected
//                             ? FontWeight.bold
//                             : FontWeight.normal,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

/////////////////////
library;

import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/features/views/home/home_page_view_body.dart';
import 'package:my_wallet/features/views/userView/user_view.dart';
import 'package:my_wallet/features/views/wallet_view/wallet_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;

  // 1. تجميع الأيقونات والعناوين في قوائم واضحة
  final List<IconData> _navIcons = [Icons.home, Icons.wallet, Icons.person];
  final List<String> _navTitle = ["Home", "Wallet", "Account"];

  // 2. قائمة الشاشات الثابتة التي سيتم التبديل بينها
  final List<Widget> _screens = const [
    HomePageViewBody(), // شاشة الرئيسية (المحتوى الذي يحتوي على السكرول)
    WalletView(), // شاشة الـ Wallet التي كانت تحتوي على Placeholder
    UserView(), // شاشة الـ User التي كانت تحتوي على Placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // توحيد خلفية الـ Scaffold الأساسي
      body: Stack(
        children: [
          // 3. استخدام IndexedStack لضمان ثبات الشاشات وحفظ حالتها أثناء التنقل
          IndexedStack(index: _selectedIndex, children: _screens),

          // 4. وضع الـ NavBar في الـ Stack لتظل طافية وعائمة دائماً في الأسفل
          _buildFloatingNavBar(),
        ],
      ),
    );
  }

  Widget _buildFloatingNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
        decoration: BoxDecoration(
          color: AppColors
              .kCardMoreNavy, // استبدال اللون المؤقت بلون الكارد الداكن الخاص بك
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navIcons.length, (index) {
            bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex =
                      index; // التبديل بين الشاشات داخلياً دون مغادرة الـ HomePageView
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                color: Colors.transparent, // لزيادة مساحة التعرف على اللمس
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _navIcons[index],
                      color: isSelected ? Colors.orange : Colors.grey.shade500,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _navTitle[index],
                      style: TextStyle(
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
