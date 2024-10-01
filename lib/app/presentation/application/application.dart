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
                  buildBottomNavBarItem(Icons.home_outlined, "home"),
                  buildBottomNavBarItem(
                      Icons.notifications_outlined, "notifications"),
                  buildBottomNavBarItem(Icons.list_alt_rounded, "orders"),
                  buildBottomNavBarItem(
                      Icons.account_circle_outlined, "profile"),
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

  BottomNavigationBarItem buildBottomNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        icon,
        color: AppColors.secondBackground,
      ),
      activeIcon: Icon(
        icon,
        color: AppColors.primary,
      ),
    );
  }
}
