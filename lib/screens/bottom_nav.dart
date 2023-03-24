import 'package:flutter/material.dart';
import 'package:step_box/const.dart';
import 'package:step_box/screens/home_screen.dart';
import 'package:step_box/screens/stats_screen.dart';
import 'package:step_box/screens/userProfile_screen.dart';

class BotttomNavigation extends StatefulWidget {
  BotttomNavigation({super.key});
  static String id = 'BotttomNavigation';

  @override
  State<BotttomNavigation> createState() => _BotttomNavigationState();
}

class _BotttomNavigationState extends State<BotttomNavigation> {
  List screens = [
    HomeScreen(),
    StatsScreen(),
    UserProfilePage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Step Box',
          style: kStepCounterText,
        ),
        elevation: 0.0,
        backgroundColor: KwhiteColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu,
            color: kblackColor,
          ),
        ),
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: GestureDetector(
        //       onTap: () {},
        //       child: const Icon(
        //         Icons.person,
        //         size: 26.0,
        //         color: kblackColor,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: kblackColor,
        unselectedItemColor: kblackColor.withOpacity(0.5),
        backgroundColor: KwhiteColor,
        // type: BottomNavigationBarType.shifting,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart), label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: screens[currentIndex],
      backgroundColor: KwhiteColor,
    );
  }
}
