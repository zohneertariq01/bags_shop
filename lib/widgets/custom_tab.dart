import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app_text.dart';

class NoSplashTab extends StatelessWidget {
  final String text;
  final int tabIndex;
  final TabController controller;

  const NoSplashTab({super.key, required this.text, required this.tabIndex, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.animateTo(tabIndex);
      },
      child: Padding(
        padding:  EdgeInsets.only(right: 1.w,top: 2.h,left: 1.w,bottom: 1.h),
        child: CustomTextWidget(title: text),
      ),
    );
  }
}
