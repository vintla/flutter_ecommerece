import 'package:ecommerce_app/app/common/helper/show_snackbar.dart';
import 'package:ecommerce_app/app/common/widgets/basic_appbar.dart';
import 'package:ecommerce_app/app/core/config/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/basic.dart';
import '../../../../common/widgets/basic_button.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  final bool order = true;

  final List<String> orderStatus = [
    "Processing",
    "Shipped",
    "Delivered",
    "Returned",
    "Canceled",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Scaffold(
        appBar: BasicAppBar(
          hideBack: true,
          title: Basic.text(
            "Orders",
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: order == true
            ? Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        height: 40.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: orderStatus.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: EdgeInsets.only(right: 12.h),
                              child: ChoiceChip(
                                backgroundColor: AppColors.secondBackground,
                                label: Text(orderStatus[i]),
                                selected: false,
                                showCheckmark: false,
                                side: const BorderSide(
                                  style: BorderStyle.none,
                                ),
                                selectedColor: AppColors.primary,
                                onSelected: (value) {},
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 560.h,
                        child: ListView.builder(
                          itemCount: 10,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                      width: 50.w,
                                      child: Icon(
                                        Icons.list_alt_rounded,
                                        fill: 1,
                                        size: 35.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200.w,
                                      height: 60.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Basic.text(
                                              "Order ID",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          Container(
                                            child: Basic.text(
                                              "2 items",
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Image.asset("assets/images/bag.png"),
                    ),
                    SizedBox(height: 10.h),
                    Basic.text(
                      "No Orders yet",
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
      ),
    );
  }
}
