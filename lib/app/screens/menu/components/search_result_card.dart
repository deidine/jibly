import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jibly/app/data/constants/constants.dart';
import 'package:jibly/app/models/food_dish.dart';
import 'package:jibly/app/screens/home/dish_detail_page.dart';
import 'package:jibly/app/screens/widgets/buttons/custom_icon_button.dart';
import 'package:get/get.dart';

class SearchResultCard extends StatelessWidget {
  final FoodDish dish;
  const SearchResultCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>FoodDishDetail(dish: dish));
      },
      child: Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            color: AppColors.kLightPink,
            borderRadius: BorderRadius.circular(30.r)),
        child: Row(
          children: [
            Image.asset(dish.image, height: 100.h, width: 100.w),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dish.name, style: AppTypography.kExtraLight15),
                  Row(
                    children: [
                      Text(
                        '\$${dish.price}',
                        style: AppTypography.kMedium14
                            .copyWith(color: AppColors.kLightBrown),
                      ),
                      SizedBox(width: 5.w),
                      Icon(Icons.star_rounded,
                          color: AppColors.kOrange, size: 15.h),
                      Text('${dish.averageRating}', style: AppTypography.kLight11)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 100.h,
              alignment: Alignment.bottomRight,
              child: CustomIconButton(
                onTap: () {},
                icon: AppAssets.kAdd,
              ),
            )
          ],
        ),
      ),
    );
  }
}
