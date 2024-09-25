import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants/src/infrastructure/resources/app_colors.dart';
import 'package:plants/src/ui/screens/fact_details/fact_details_screen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../infrastructure/resources/app_styles.dart';
import '../../widgets/app_button.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1B2228,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemBuilder: (BuildContext context, int index) {
                  return AppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FactDetailsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.blue1B2228,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.white.withOpacity(0.5),
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
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
                            child: Text(
                              'Plants Produce Oxygen',
                              style:
                                  AppStyles.helper1.copyWith(fontSize: 18.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 16.h),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
