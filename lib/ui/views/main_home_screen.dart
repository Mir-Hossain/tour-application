import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/views/bottom_nav_controller/nav_controller.dart';
import 'package:shelter/ui/views/drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  Future _exitDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are u sure to close this app?"),
            content: Row(
              children: [
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text("No"),
                ),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            const DrawerScreen(),
            BottomNavController(),
          ],
        ),
      ),
    );
  }
}
