import 'package:flutter/material.dart';
import 'package:jibly/app/models/categories.dart';
import 'package:jibly/app/models/cuisine.dart';
import 'package:jibly/app/models/food_dish.dart';
import 'package:get/get.dart';

class SearchControllers extends GetxController {
  Rx<List<FoodDish>> searchResults = Rx<List<FoodDish>>([]);
  Rx<DishCategory?> selectedCategory = Rx<DishCategory?>(null);
  Rx<Cuisine?> selectedCuisine = Rx<Cuisine?>(null);
  Rx<RangeValues> priceRange = Rx<RangeValues>(const RangeValues(0, 100));

  void performSearch(String text) {
    if (text.isNotEmpty) {
      List<FoodDish> results = foodDishes.where((dish) {
        return dish.name.toLowerCase().contains(text.toLowerCase());
      }).toList();
      searchResults.value.assignAll(results);
    } else {
      searchResults.value.clear();
    }
  }

   void applyFilters() {
    searchResults.value = foodDishes.where((dish) {
      final isInSelectedCategory = selectedCategory.value == null ||
          selectedCategory.value == dish.category;
      final isInSelectedCuisine = selectedCuisine.value == null ||
          selectedCuisine.value == dish.cuisine;
      final isInPriceRange =
          dish.price >= priceRange.value.start && dish.price <= priceRange.value.end;
      return isInSelectedCategory && isInSelectedCuisine && isInPriceRange;
    }).toList();
  }
}
