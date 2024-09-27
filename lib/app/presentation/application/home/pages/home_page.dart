import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        action: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 50.h,
              width: 50.w,
              child: CircleAvatar(
                child: Image.asset("assets/images/profile.png"),
              ),
            ),
            const DropdownMenu(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "Men", label: "Men"),
                DropdownMenuEntry(value: "Men", label: "Men"),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: AppColors.background,
      ),
    );
  }
}
