import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: Basic.text(
          "Notifications",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Image.asset("assets/images/notification.png"),
            ),
            SizedBox(height: 10.h),
            Basic.text(
              "No Notification yet",
              fontSize: 18.sp,
            ),
            SizedBox(height: 20.h),
            BasicButton(
              onPressed: () {},
              title: "Explore Categories",
              width: 100.w,
            ),
          ],
        ),
      ),
    );
  }
}
