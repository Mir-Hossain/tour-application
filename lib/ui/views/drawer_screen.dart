import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:shelter/const/app_strings.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/widgets/drawer_item.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.appName,
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              "Travel Agency",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20.h,
            ),
            drawerItem(
              "Support",
              () => Get.toNamed(supportScreen),
            ),
            drawerItem(
              "Privacy",
              () => Get.toNamed(privacyScreen),
            ),
            drawerItem(
              "FAQ",
              () => Get.toNamed(faqScreen),
            ),
            drawerItem(
              "Rate US",
              () => LaunchReview.launch(
                androidAppId: "com.example.shelter",
                iOSAppId: "585027354",
              ),
            ),
            drawerItem(
              "How to use",
              () => Get.toNamed(howToUseScreen),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () => Get.toNamed(settingsScreen),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
