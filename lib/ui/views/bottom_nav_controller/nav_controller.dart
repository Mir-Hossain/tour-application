// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:shelter/const/app_strings.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_add.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_favourite.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_home.dart';

class BottomNavController extends StatelessWidget {
  final RxInt _currentIndex = 0.obs;
  final RxBool _drawer = false.obs;

  final _pages = [
    NavHome(),
    NavAdd(),
    NavFavourite(),
  ];

  BottomNavController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 400),
        top: _drawer.value == false ? 0 : 100.h,
        bottom: _drawer.value == false ? 0 : 100.h,
        left: _drawer.value == false ? 0 : 200.w,
        right: _drawer.value == false ? 0 : -100.w,
        child: Container(
          decoration: BoxDecoration(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              leading: _drawer.value == false
                  ? IconButton(
                      onPressed: () {
                        _drawer.value = true;
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _drawer.value = false;
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
              title: Text(AppStrings.appName),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => _currentIndex.value = value,
              currentIndex: _currentIndex.value,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_outlined), label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outlined), label: "Favorite"),
              ],
            ),
            body: _pages[_currentIndex.value],
          ),
        ),
      ),
    );
  }
}
