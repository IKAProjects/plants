import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants/src/infrastructure/resources/app_colors.dart';

import '../../../infrastructure/resources/app_styles.dart';
import '../../widgets/app_button.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  bool isTypesSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1B2228,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onPressed: () {
                    setState(() {
                      isTypesSelected = false;
                    });
                  },
                  child: Text(
                    'Types of plants',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: !isTypesSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                AppButton(
                  onPressed: () {
                    setState(() {
                      isTypesSelected = true;
                    });
                  },
                  child: Text(
                    'Care Tips',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: isTypesSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
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

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pothos: ',
                                style:
                                AppStyles.helper1.copyWith(fontSize: 20.sp),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Pothos, also known as Devil’s Ivy, is a popular houseplant known for its heart-shaped, glossy leaves that can be green or variegated with white, yellow, or light green streaks. It’s a fast-growing, vining plant that can thrive in a variety of conditions, making it a favorite for indoor gardening.',
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
            ),
          ],
        ),
      ),
    );
  }
}
