import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jibly/app/controllers/cart_controller.dart';
import 'package:jibly/app/data/constants/constants.dart';
import 'package:jibly/app/models/food_dish.dart';
import 'package:jibly/app/screens/cart/cart_view.dart';
import 'package:jibly/app/screens/home/components/detail_info_chips.dart';
import 'package:jibly/app/screens/home/components/detail_page_image_card.dart';
import 'package:jibly/app/screens/home/components/ingredient_card.dart';
import 'package:jibly/app/screens/widgets/buttons/custom_icon_button.dart';
import 'package:jibly/app/screens/widgets/buttons/custom_outlined_button.dart';
import 'package:jibly/app/screens/widgets/buttons/custom_text_button.dart';
import 'package:jibly/app/screens/widgets/dialogs/aadding_topping_dialog.dart';
import 'package:jibly/app/screens/widgets/dialogs/about_review_dialog.dart';
import 'package:get/get.dart';

class FoodDishDetail extends StatefulWidget {
  final FoodDish dish;
  const FoodDishDetail({super.key, required this.dish});

  @override
  State<FoodDishDetail> createState() => _FoodDishDetailState();
}

class _FoodDishDetailState extends State<FoodDishDetail> {
  @override
  Widget build(BuildContext context) {
    CartController cc = Get.put(CartController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kLightPink,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.kLightPink,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30.r))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailPageImageCard(
                  dish: widget.dish,
                  addToCart: () {
                    cc.addToCart(widget.dish, 1);
                  },
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(widget.dish.name,
                              style: AppTypography.kBold24)),
                      Text('\$${widget.dish.price}',
                          style: AppTypography.kMedium24
                              .copyWith(color: AppColors.kLightBrown)),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      const DetailInfoChips(
                        text: '320 Cal',
                      ),
                      SizedBox(width: 10.w),
                      const DetailInfoChips(
                        text: '120 Gram',
                      ),
                      SizedBox(width: 10.w),
                      DetailInfoChips(
                        isRatingChip: true,
                        text: widget.dish.averageRating.toString(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      if (i < widget.dish.ingredients.length) {
                        return IngredientCard(
                          image: widget.dish.ingredients[i].image,
                        );
                      } else if (i == widget.dish.ingredients.length) {
                        return CustomIconButton(
                          onTap: () {
                            Get.dialog(AddToppingDialog(
                              dish: widget.dish,
                            ));
                          },
                          icon: AppAssets.kAdd,
                          borderCol: Colors.transparent,
                          iconColor: AppColors.kPrimary,
                          size: 60.h,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                    separatorBuilder: (ctx, i) => SizedBox(width: 8.w),
                    itemCount: widget.dish.ingredients.length + 1,
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                    child: CustomTextButton(
                  onPressed: () {
                    Get.dialog(const AboutAndReviewDialog());
                  },
                  text: 'ABOUT & REVIEW',
                  fontSize: 13.sp,
                  color: AppColors.kSecondary,
                )),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Image.asset(widget.dish.image, height: 60.h, width: 60.w),
                const Spacer(),
                CustomOutlinedButton(
                  onTap: () {
                    Get.to(() => const CartView());
                  },
                  text: 'Cart',
                  width: 110.w,
                  height: 50.h,
                  borderRadius: 10.r,
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
