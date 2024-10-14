import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/core/config/themes/app_colors.dart';
import 'package:ecommerce_app/app/presentation/application/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Scaffold(
        appBar: BasicAppBar(
          hideBack: true,
          action: Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                avatar(),
                dropDownMenu(),
                cart(),
              ],
            ),
          ),
        ),
        body: Container(
          child: const SingleChildScrollView(
            child: Column(
              children: [
                Text("Search"),
                Text("Categories"),
                Text("Top Selling"),
                Text("New In"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
