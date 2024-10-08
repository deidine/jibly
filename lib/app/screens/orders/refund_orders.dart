import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jibly/app/screens/orders/components/order_card.dart';
import 'package:jibly/app/screens/orders/components/refund_order_card.dart';

class RefundOrders extends StatelessWidget {
  const RefundOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (ctx, i) {
          return const RefundOrderCard();
        },
        separatorBuilder: (ctx, i) => SizedBox(height: 20.h),
        itemCount: 1);
  }
}
