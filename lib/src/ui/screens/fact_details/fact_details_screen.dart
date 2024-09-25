import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../infrastructure/resources/app_colors.dart';
import '../../../infrastructure/resources/app_styles.dart';
import '../../widgets/app_button.dart';

class FactDetailsScreen extends StatelessWidget {
  const FactDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1B2228,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.blue1B2228,
        leading: Center(
          child: AppButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              Assets.svg.arrowBack,
              fit: BoxFit.contain,
              width: 28.w,
              height: 28.h,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: AppColors.blue1B2228,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.png.plantImg.image(
                        fit: BoxFit.cover,
                        height: 200.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. Plants Can Communicate',
                              style:
                              AppStyles.helper1.copyWith(fontSize: 18.sp),
                            ),
                            Text(
                              """• Some plants release chemicals into the air to warn neighboring plants of insect attacks. For example, when a plant like sagebrush is attacked by herbivores, it can release distress signals to nearby plants, alerting them to activate their defenses.""",
                              style:
                              AppStyles.helper4,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 16.h),
              itemCount: 2,
            ),
          )
        ],
      ),
    );
  }
}
