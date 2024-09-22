import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/config/config.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroudColor;
  final bool hideBack;
  final double height;

  const BasicAppBar({
    super.key,
    this.title,
    this.action,
    this.backgroudColor,
    this.hideBack = false,
    this.height = 80,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroudColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height.h,
      title: title ?? const Text(""),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                height: 50.h,
                width: 50.h,
                decoration: const BoxDecoration(
                  color: AppColors.secondBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
