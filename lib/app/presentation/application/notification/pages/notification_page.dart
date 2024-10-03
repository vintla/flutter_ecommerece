import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/config.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  final bool notification = true;
  final bool isReaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Scaffold(
          appBar: BasicAppBar(
            hideBack: true,
            title: Basic.text(
              "Notifications",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: notification ? notificationList() : noNotifYet()),
    );
  }

  Widget notificationList() {
    return SingleChildScrollView(
      child: Container(
        height: 600.h,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () => showSnackbar(context, "Order"),
              splashColor: Colors.transparent,
              child: Container(
                height: 60.h,
                width: 300.w,
                padding: EdgeInsets.symmetric(vertical: 6.h),
                margin: EdgeInsets.symmetric(vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: isReaded == true
                          ? _readedNotification()
                          : _notReadedNotification(),
                    ),
                    SizedBox(
                      width: 240.w,
                      height: 60.h,
                      child: Container(
                        padding: EdgeInsets.only(top: 6.h, right: 6.w),
                        child: Basic.text(
                          "Alvin, you placed an orcer check your order history here for full details.",
                          fontWeight: FontWeight.normal,
                          fontSize: 9.sp,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _readedNotification() {
    return Icon(
      Icons.notifications_outlined,
      fill: 1,
      size: 35.sp,
    );
  }

  Widget _notReadedNotification() {
    return Stack(
      children: [
        Icon(
          Icons.notifications_outlined,
          fill: 1,
          size: 35.sp,
        ),
        Positioned(
          top: 10,
          left: 30,
          child: Container(
            height: 6.h,
            width: 6.w,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget noNotifYet() {
    return Center(
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
    );
  }
}
