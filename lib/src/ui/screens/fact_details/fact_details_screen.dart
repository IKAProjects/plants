import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../domain/models/fact_model.dart';
import '../../../infrastructure/resources/app_colors.dart';
import '../../../infrastructure/resources/app_styles.dart';
import '../../widgets/app_button.dart';

class FactDetailsScreen extends StatelessWidget {
  const FactDetailsScreen({super.key, required this.factModel});

  final FactModel factModel;

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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: AppColors.blue1B2228,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                   borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    factModel.details[index].image,
                    fit: BoxFit.cover,
                    height: 200.h,
                    width: double.infinity,
                  ),
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
                        factModel.details[index].name,
                        style:
                        AppStyles.helper1.copyWith(fontSize: 18.sp),
                      ),
                      Text(
                        """• ${factModel.details[index].description}""",
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
        itemCount: factModel.details.length,
      ),
    );
  }
}
