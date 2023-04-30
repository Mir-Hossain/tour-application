import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/const/app_colors.dart';

// ignore: must_be_immutable
class VioletButton extends StatelessWidget {
  String title;
  final Function onAction;
  VioletButton(this.title, this.onAction, {Key? key}) : super(key: key);

  final RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: AppColors.violetColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          // ignore: unrelated_type_equality_checks
          child: _value == false
              ? Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: Colors.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please Wait",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Transform.scale(
                        scale: 0.4,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        )),
                  ],
                ),
        ),
      ),
    );
  }
}
