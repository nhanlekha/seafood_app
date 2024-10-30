import 'package:flutter/material.dart';

import '../category_screens/category_screens.dart';
import '../home_screens/home_screens.dart';
import '../order_screens/order_screens.dart';
import '../personal_screens/personal_screens.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  late final List<Widget> _pages;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreens(),
      CategoryScreens(),
      OrderScreens(),
      Container(color: Colors.green),
      PersonalPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IndexedStack(
            index: _currentPage,
            children: _pages,
          ),
        ),
        BottomNavigationBar(
          backgroundColor: const Color(0xFFFefaf9),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPage,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/home.png', width: 24, height: 24),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/options.png', width: 24, height: 24),
              label: "Danh mục",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/cargo.png', width: 24, height: 24),
              label: "Đơn hàng",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/chat.png', width: 24, height: 24),
              label: "Yêu Thích",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/teamwork.png', width: 24, height: 24),
              label: "Cá Nhân",
            ),
          ],
        ),
      ],
    );
  }
}
