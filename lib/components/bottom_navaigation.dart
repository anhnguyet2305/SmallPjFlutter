import 'package:flutter/material.dart';
import 'package:food/components/home.dart';
import 'package:food/screens/body_home.dart';
import 'package:food/screens/custom_bottom_navigation.dart';
import 'package:food/screens/favorite.dart';
import 'package:food/screens/history.dart';
import 'package:food/screens/new_home.dart';
import 'package:food/screens/profile.dart';

class BottomNavigation extends StatefulWidget {
  final Function openDrawer;

  const BottomNavigation({Key? key, required this.openDrawer})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                ContentHome(
                  openDrawer: () {
                    widget.openDrawer();
                  },
                ),
                Favorite(),
                History(),
                ProfileScreen(openDrawer: () {})
              ],
              controller: _pageController,
            ),
          ),
          CustomBottomNavigation(
            currentIndex: _currentIndex,
            onItemTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
              _pageController.jumpToPage(index);
            },
            icons: const [
              Icons.home,
              Icons.history,
              Icons.person,
              Icons.two_k_plus_sharp,
            ],
          ),
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: PageView(
    //     children: [
    //       ContentHome(
    //         openDrawer: () {},
    //       ),
    //       Favorite(),
    //       History(),
    //       ProfileScreen(openDrawer: () {})
    //     ],
    //     controller: _pageController,
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //       unselectedItemColor: Colors.grey,
    //       selectedItemColor: Colors.deepOrange,
    //       showUnselectedLabels: false,
    //       showSelectedLabels: false,
    //       selectedFontSize: 20,
    //       unselectedFontSize: 18,
    //       currentIndex: _currentIndex,
    //       onTap: (index) {
    //         setState(() => _currentIndex = index);
    //         _pageController.jumpToPage(index);
    //       },
    //       items: const [
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.favorite_border),
    //           label: 'Favorite',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.person),
    //           label: 'Account',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.restore),
    //           label: 'Restote',
    //         ),
    //       ]),
    // );
  }
}
