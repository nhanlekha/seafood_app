import 'package:flutter/material.dart';
import '../home_screens/home_screens.dart';
import '../order_screens/order_screens.dart';
import '../personal_screens/personal_screens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:seafood_app/screens/page/order_screens/order_screens.dart';
import 'package:seafood_app/screens/page/category_screens/category_screens.dart';
import 'package:seafood_app/screens/page/favourite_screens/favourite_screens.dart';

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
      const HomeScreens(),
      const CategoryScreens(),
      const OrderScreens(),
      const FavouriteScreens(),
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
            setState(() {
              _currentPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('assets/images/home.png'),
              ),
              label: "Home".tr(),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('assets/images/options.png'),
              ),
              label: "Danh mục",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('assets/images/cargo.png'),
              ),
              label: "Đơn hàng",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('assets/images/chat.png'),
              ),
              label: "Yêu Thích",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset('assets/images/teamwork.png'),
              ),
              label: "Cá Nhân",
            ),
          ],
        ),
      ],
    );
  }
}
