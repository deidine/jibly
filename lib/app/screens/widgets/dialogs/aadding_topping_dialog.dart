import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jibly/app/controllers/cart_controller.dart';
import 'package:jibly/app/data/constants/constants.dart';
import 'package:jibly/app/models/food_dish.dart';
import 'package:jibly/app/screens/menu/components/filter_sheet.dart';
import 'package:jibly/app/screens/widgets/buttons/primary_button.dart';
import 'package:jibly/app/screens/widgets/dialogs/topping_ingredient_card.dart';
import 'package:jibly/app/screens/widgets/dialogs/toppings_added_dialog.dart';
import 'package:get/get.dart';

class AddToppingDialog extends StatelessWidget {
  final FoodDish dish;
  const AddToppingDialog({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (cc) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            backgroundColor: AppColors.kLightPink2,
            insetPadding: EdgeInsets.zero,
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomDivider(),
                  SizedBox(height: 20.h),
                  Text('Add Topping', style: AppTypography.kBold24),
                  Text('Add & add new ingredients  to your liking',
                      style: AppTypography.kLight14),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 340.h,
                    child: ListView.separated(
                        itemBuilder: (ctx, i) {
                          return ToppingIngredientCard(
                            ingredient: dish.ingredients[i],
                            addQuantity: () {},
                            removeQuantity: () {},
                          );
                        },
                        separatorBuilder: (ctx, i) {
                          return SizedBox(height: 20.h);
                        },
                        itemCount: dish.ingredients.length),
                  ),
                  SizedBox(height: 31.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total', style: AppTypography.kLight14),
                          Text('\$${dish.price}', style: AppTypography.kBold24),
                        ],
                      ),
                      const Spacer(),
                      PrimaryButton(
                        onTap: () {
                          Get.back();
                          Get.dialog(ToppingAddedDialog(
                            dish: dish,
                          ));
                        },
                        text: 'Add To Dish',
                        width: 160.w,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
