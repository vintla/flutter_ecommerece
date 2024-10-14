import 'package:ecommerce_app/app/common/widgets/basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/config.dart';

Widget avatar() {
  return Container(
    height: 35.h,
    width: 35.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18.h),
      image: const DecorationImage(
        image: AssetImage(
          "assets/images/profile.png",
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget dropDownMenu() {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.secondBackground,
      borderRadius: BorderRadius.circular(12.h),
    ),
    child: DropdownButton(
      borderRadius: BorderRadius.circular(12.h),
      dropdownColor: AppColors.secondBackground,
      focusColor: AppColors.primary,
      underline: Container(
        color: Colors.transparent,
      ),
      value: "Men",
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 10,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      onChanged: (value) {},
      items: const [
        DropdownMenuItem(
          value: "Men",
          child: Text("Men"),
        ),
        DropdownMenuItem(
          value: "Woman",
          child: Text("Woman"),
        )
      ],
    ),
  );
}

Widget cart() {
  return IconButton(
    onPressed: () {},
    icon: Container(
      height: 35.h,
      width: 35.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
      child: const Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
      ),
    ),
  );
}

// Widget searchBar(TextEditingController con) {
//   return Basic.textField(context, con, "search");
// }
//
Widget categories() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, i) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/images/jacket.png"),
      );
    },
  );
}

Widget topSelling() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, i) {
      return Card(
        child: Image.asset("assets/images/jacket.png"),
      );
    },
  );
}

Widget newIn() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, i) {
      return Card(
        child: Image.asset("assets/images/jacket.png"),
      );
    },
  );
}
