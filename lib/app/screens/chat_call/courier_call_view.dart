import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jibly/app/data/constants/constants.dart';
import 'package:jibly/app/screens/menu/components/filter_sheet.dart';
import 'package:jibly/app/screens/widgets/buttons/custom_icon_button.dart';

class CourierCallView extends StatelessWidget {
  const CourierCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: AppColors.kLightPink2,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
          child: Column(
            children: [
              const CustomDivider(),
              const Spacer(),
              SizedBox(
                width: 230.w,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(AppAssets.kDetailBg, width: 230.w),
                    Column(
                      children: [
                        Container(
                          height: 160.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(AppAssets.kProfilePic),
                                  fit: BoxFit.cover)),
                        ),
                        Text('David John', style: AppTypography.kBold18),
                        Text('Calling...', style: AppTypography.kLight14),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: () {},
                    icon: AppAssets.kSpeaker,
                  ),
                  SizedBox(width: 30.w),
                  CustomIconButton(
                    onTap: () {},
                    iconColor: AppColors.kOrange,
                    icon: AppAssets.kEndCall,
                    borderCol: Colors.transparent,
                  ),
                  SizedBox(width: 30.w),
                  CustomIconButton(
                    onTap: () {},
                    icon: AppAssets.kMicro,
                  ),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
