import 'package:flutter/material.dart';
import 'package:jibly/app/controllers/favorite_controller.dart';
import 'package:jibly/app/data/constants/constants.dart';
import 'package:jibly/app/models/food_dish.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class CustomLikeButton extends StatelessWidget {
  final FoodDish dish;
  const CustomLikeButton({
    required this.dish,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();

    return Obx(() {
      final isProductLiked = favoriteController.isProductInFavorites(dish);
      return LikeButton(
        size: 30,
        padding: EdgeInsets.zero,
        circleColor: const CircleColor(
          start: AppColors.kPrimary,
          end: AppColors.kPrimary,
        ),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: AppColors.kPrimary,
          dotSecondaryColor: AppColors.kPrimary,
        ),
        isLiked: isProductLiked,
        likeBuilder: (isProductLiked) {
          return Icon(
            isProductLiked ? Icons.favorite : Icons.favorite_border_rounded,
            color: AppColors.kOrange,
            size: 30,
          );
        },
        onTap: (isProductLiked) {
          if (isProductLiked) {
            favoriteController.removeFromFavorites(dish);
          } else {
            favoriteController.addToFavorites(dish);
          }
          return Future.value(!isProductLiked);
        },
      );
    });
  }
}
