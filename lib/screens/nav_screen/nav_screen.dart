import 'package:flutter/material.dart';

import '../../my_app_exports.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ShortsScreen(),
    const AddScreen(),
    const SubscriptionScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // by this method when we switch to another tab our rendered details will be remembered instead of rebuild
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: selectedIndex != i,
                    child: screen,
                  ),
                ))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.white,
            ),
            label: 'Home',
            tooltip: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: AppColors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection_outlined,
              color: AppColors.white,
            ),
            label: 'Shorts',
            tooltip: 'Shorts',
            activeIcon: Icon(Icons.video_collection_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_outlined,
              color: AppColors.white,
              size: 40,
            ),
            label: 'Add',
            tooltip: 'Add',
            activeIcon: Icon(
              Icons.add_circle_outlined,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions_outlined,
              color: AppColors.white,
            ),
            label: 'Subscription',
            tooltip: 'Subscription',
            activeIcon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: AppColors.white,
            ),
            label: 'Profile',
            tooltip: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
