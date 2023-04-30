import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  TextStyle myTextStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp);

  InputDecoration textFieldDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 15.sp,
        ),
      );

  progressDialog(context) => showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text("Processing"),
            ],
          ),
        ),
      );
}
