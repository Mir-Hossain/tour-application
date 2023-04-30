import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/widgets/violet_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class PrivacyPolicy extends StatelessWidget {
  final RxBool _loaded = false.obs;

  PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
          child: Column(
            children: [
              Expanded(
                child: SfPdfViewer.network(
                  'https://firebasestorage.googleapis.com/v0/b/shelter-b9151.appspot.com/o/privacy%20policy%2Fprivacy-policy.pdf?alt=media&token=98e4c1b0-c75c-4c2c-9403-326eca08f86c',
                  onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                    _loaded.value = true;
                  },
                ),
              ),
              Obx(
                // ignore: unrelated_type_equality_checks
                () => _loaded == true
                    ? VioletButton(
                        "Agree",
                        () => Get.toNamed(mainHomeScreen),
                      )
                    : const Text('Still Loading'),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
