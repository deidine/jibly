import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jibly/app/data/constants/constants.dart';
import 'package:jibly/app/models/food_dish.dart';
import 'package:jibly/app/screens/menu/components/search_result_card.dart';
import 'package:jibly/app/screens/widgets/buttons/custom_icon_button.dart';

class FavoriteCard extends StatelessWidget {
  final FoodDish dish;
  final VoidCallback removeCallback;
  const FavoriteCard(
      {super.key, required this.dish, required this.removeCallback});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            SizedBox(width: 20.w),
            CustomIconButton(
              icon: AppAssets.kDelete,
              onTap: removeCallback,
            ),
          ],
        ),
        child: SearchResultCard(
          dish: dish,
        ));
  }
}
