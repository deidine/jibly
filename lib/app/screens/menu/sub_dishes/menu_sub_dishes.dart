import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jibly/app/data/constants/constants.dart';
import 'package:jibly/app/models/categories.dart';
import 'package:jibly/app/screens/menu/components/custom_indicator_shape.dart';
import 'package:jibly/app/screens/menu/sub_dishes/all_sub_dishes.dart';
import 'package:get/get.dart';

class MenuSubDishes extends StatelessWidget {
  final DishCategory categories;
  const MenuSubDishes({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(AppAssets.kSearch),
            ),
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(AppAssets.kFilter),
            ),
            SizedBox(width: 10.w),
          ],
        ),
        body: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text('${categories.name} Dish',
                        style: AppTypography.kBold30),
                    TabBar(
                      indicator: BoxTabIndicator(
                          width: 25.w, color: AppColors.kPrimary),
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(left: 0, right: 29.w),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: AppTypography.kMedium16,
                      labelColor: AppColors.kSecondary,
                      unselectedLabelColor: AppColors.kLightBrown,
                      tabs: const [
                        Tab(text: 'All Menu'),
                        Tab(text: 'Specials'),
                        Tab(text: 'Discount'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [AllSubDishes(
              category: categories,
            ), Container(), Container()],
          ),
        ),
      ),
    );
  }
}
