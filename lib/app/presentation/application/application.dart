import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/config/themes/app_colors.dart';
import 'home/pages/home_page.dart';
import 'order/pages/order_page.dart';
import 'notification/pages/notification_page.dart';
import 'application_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationCubit, ApplicationStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: _buildPage(
              state.index,
            ),
            bottomNavigationBar: Container(
              height: 80.h,
              width: 390.w,
              // padding: EdgeInsets.all(15.h),
              child: BottomNavigationBar(
                backgroundColor: AppColors.background,
                currentIndex: state.index,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                unselectedItemColor: AppColors.secondBackground,
                showUnselectedLabels: false,
                elevation: 0,
                items: [
                  buildBottomNavBarItem(Icons.home_outlined, "home", false),
                  buildBottomNavBarItem(
                      Icons.notifications_outlined, "notifications", true),
                  buildBottomNavBarItem(
                      Icons.list_alt_rounded, "orders", false),
                  buildBottomNavBarItem(
                      Icons.account_circle_outlined, "profile", false),
                ],
                onTap: (value) {
                  context.read<ApplicationCubit>().menuIndex(value);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPage(int index) {
    List<Widget> pages = [
      const HomePage(),
      const NotificationPage(),
      OrderPage(),
      const Center(
        child: Text("Profile"),
      )
    ];

    return pages[index];
  }

  BottomNavigationBarItem buildBottomNavBarItem(
      IconData icon, String label, bool isNotification) {
    return BottomNavigationBarItem(
      label: label,
      icon: Stack(
        children: [
          Icon(
            icon,
            color: AppColors.secondBackground,
          ),
          isNotification
              ? Positioned(
                  top: 5,
                  left: 15,
                  child: Container(
                    height: 4.h,
                    width: 4.w,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      activeIcon: Stack(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
          ),
          isNotification
              ? Positioned(
                  top: 5,
                  left: 15,
                  child: Container(
                    height: 4.h,
                    width: 4.w,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _readedNotification(bool isActive) {
    return Icon(
      Icons.notifications_outlined,
      fill: 1,
      size: 35.sp,
      color: isActive == true ? AppColors.primary : AppColors.secondBackground,
    );
  }

  Widget _notReadedNotification(bool isActive) {
    return Stack(
      children: [
        Icon(
          Icons.notifications_outlined,
          fill: 1,
          size: 35.sp,
          color:
              isActive == true ? AppColors.primary : AppColors.secondBackground,
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
}
